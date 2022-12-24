// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Token {
    mapping(address => uint) public balances;
    uint public totalSupply;

    event Transfer(
        address indexed from,
        address indexed to,
        uint value
    );

    constructor() public {
        totalSupply = 0;
    }

    function issueTokens(uint value) public {
        require(value > 0, "Cannot issue 0 or negative tokens.");
        balances[msg.sender] += value;
        totalSupply += value;
    }

    function transferTokens(address to, uint value) public {
        require(to != address(0), "Cannot transfer tokens to the zero address.");
        require(value > 0, "Cannot transfer 0 or negative tokens.");
        require(balances[msg.sender] >= value, "Insufficient balance.");
        balances[msg.sender] -= value;
        balances[to] += value;

        emit Transfer(msg.sender, to, value);
    }

    function balanceOf(address owner) public view returns (uint) {
        require(owner != address(0), "Cannot fetch balance for the zero address.");
        return balances[owner];
    }
}
