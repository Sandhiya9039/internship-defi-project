// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    // Token details
    string public name = "MyToken";
    string public symbol = "MTK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    // Mapping to store each address's balance
    mapping(address => uint256) public balanceOf;

    // Event to log transfers
    event Transfer(address indexed from, address indexed to, uint256 value);

    // Constructor: sets the initial supply and assigns it to the deployer
    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * (10 ** uint256(decimals));
        balanceOf[msg.sender] = totalSupply; // Give all tokens to contract creator
    }

    // Function to transfer tokens to another address
    function transfer(address to, uint256 amount) public returns (bool) {
        require(balanceOf[msg.sender] >= amount, "Not enough balance");
        require(to != address(0), "Invalid address");

        // Perform transfer
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        // Emit the transfer event
        emit Transfer(msg.sender, to, amount);
        return true;
    }

    // Optional: Get your own balance
    function getMyBalance() public view returns (uint256) {
        return balanceOf[msg.sender];
    }
}