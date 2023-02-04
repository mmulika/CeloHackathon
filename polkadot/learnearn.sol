pragma solidity ^0.8.0;

contract Token {
    function transfer(address _to, uint256 _value) public;
    function balanceOf(address _owner) public view returns (uint256);
}

contract DAO {
    address public owner;
    mapping (address => uint) public points;
    Token public token;
    uint public rewardPerPoint;

    constructor(Token _token, uint _rewardPerPoint) public {
        owner = msg.sender;
        token = _token;
        rewardPerPoint = _rewardPerPoint;
    }

    function earnPoints(uint _points) public {
        require(msg.sender == owner, "Only owner can add points.");
        points[msg.sender] += _points;
    }

    function redeemPoints() public {
        uint earned = points[msg.sender];
        require(earned > 0, "You have no points to redeem.");
        require(token.balanceOf(address(this)) >= earned * rewardPerPoint, "Insufficient balance.");
        token.transfer(msg.sender, earned * rewardPerPoint);
        points[msg.sender] = 0;
    }
}
