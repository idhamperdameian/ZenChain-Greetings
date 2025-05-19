// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract ZenGreetings {
    string public name;
    address public owner;

    event NameChanged(string oldName, string newName);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(string memory initialName) {
        name = initialName;
        owner = msg.sender;
    }

    function changeName(string memory newName) external onlyOwner {
        string memory oldName = name;
        name = newName;
        emit NameChanged(oldName, newName);
    }

    function greet() external view returns (string memory) {
        return string(abi.encodePacked("Hello, ", name, "!"));
    }
}