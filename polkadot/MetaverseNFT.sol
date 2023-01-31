pragma solidity ^0.8.0;

contract MetaverseNFT {
    address owner; // wallet address of the owner
    string name; // name
    string metadata; // metadata
    mapping(address => bool) approved;
    mapping(address => uint) balanceOf;
    mapping(address => mapping(address => bool)) allowed;

    constructor(string memory _name, string memory _metadata) public {
        owner = msg.sender;
        name = _name;
        metadata = _metadata;
        balanceOf[msg.sender] = 1;
    }

    function approve(address _spender, address _to) public {
        require(msg.sender == owner, "Only the owner can approve a transfer.");
        allowed[msg.sender][_spender] = true;
    }

    function transfer(address _to) public {
        require(approved[msg.sender], "Sender must be approved.");
        require(msg.sender == owner, "Only the owner can transfer the NFT.");
        require(_to != address(0), "Cannot transfer to address 0.");
        require(balanceOf[msg.sender] > 0, "Sender has no NFT to transfer.");
        require(allowed[msg.sender][msg.sender], "Transfer not approved by NFT owner.");
        balanceOf[msg.sender]--;
        balanceOf[_to]++;
        owner = _to;
    }

    function mint() public {
        require(msg.sender == owner, "Only the owner can mint new NFTs.");
        balanceOf[msg.sender]++;
    }

    function getInfo() public view returns (address, string memory, string memory) {
        return (owner, name, metadata);
    }
}
