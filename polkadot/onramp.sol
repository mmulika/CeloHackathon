pragma solidity ^0.8.0;

contract Onramp {
    mapping(address => uint256) public balances;

    function deposit(uint256 amount) public {
        require(msg.value == amount, "Incorrect deposit amount");
        balances[msg.sender] += amount;
    }

    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient funds");
        msg.sender.transfer(amount);
        balances[msg.sender] -= amount;
    }
}
