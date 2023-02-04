pragma solidity ^0.8.0;

contract NFTEventCertificate {
    // Event details
    string public name;
    uint256 public date;
    string public location;
    
    // Owner of the certificate
    address public owner;
    
    // Constructor to initialize the event details
    constructor(string memory _name, uint256 _date, string memory _location) public {
        name = _name;
        date = _date;
        location = _location;
        owner = msg.sender;
    }
    
    // Function to transfer ownership of the certificate
    function transferOwnership(address newOwner) public {
        require(msg.sender == owner, "Only the owner can transfer ownership");
        owner = newOwner;
    }
}
