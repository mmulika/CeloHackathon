pragma solidity ^0.8.0;

contract MusicNFT {
    // Define the struct for our NFT music asset
    struct MusicAsset {
        string name;
        string artist;
        uint256 price;
        address owner;
    }

    // Mapping of the NFTs and their unique IDs
    mapping (uint256 => MusicAsset) public assets;
    uint256 public assetCounter;

    // Event to track the transfer of ownership of an NFT
    event Transfer(
        uint256 indexed id,
        address indexed from,
        address indexed to
    );

    // Function to create a new NFT music asset
    function createAsset(string memory _name, string memory _artist, uint256 _price) public {
        // Increment the asset counter and use it as the ID for the new NFT
        assetCounter++;
        uint256 id = assetCounter;

        // Store the information for the new NFT
        assets[id] = MusicAsset(_name, _artist, _price, msg.sender);
    }

    // Function to transfer ownership of an NFT to a new address
    function transferAsset(uint256 _id, address _to) public {
        // Ensure the ID is valid and the NFT is owned by the caller
        require(assets[_id].owner == msg.sender, "Asset not owned by caller");

        // Update the owner of the NFT and trigger the Transfer event
        assets[_id].owner = _to;
        emit Transfer(_id, msg.sender, _to);
    }
}
