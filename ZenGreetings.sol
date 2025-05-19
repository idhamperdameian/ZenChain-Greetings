// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract ZenGreetings {
    string public name;
    address public owner;
    uint256 public nameChangeCount; // Added line: counter for fun!

    event NameChanged(string oldName, string newName, uint256 totalChanges);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(string memory initialName) {
        name = initialName;
        owner = msg.sender;
        nameChangeCount = 0; // Initialize counter
    }

    function changeName(string memory newName) external onlyOwner {
        string memory oldName = name;
        name = newName;
        nameChangeCount += 1; // Increment counter
        emit NameChanged(oldName, newName, nameChangeCount); // Updated event
    }

    function greet() external view returns (string memory) {
        return string(abi.encodePacked("Hello, ", name, "!"));
    }

    // Get a cheerful comment on how often the name changed
    function nameChangeComment() external view returns (string memory) {
        if (nameChangeCount == 0) {
            return "No name changes yet.";
        } else if (nameChangeCount < 5) {
            return "Nice! You're mixing it up!";
        } else if (nameChangeCount < 10) {
            return "Good! You've almost changed your name 10 times!";
        } else {
            return "Whoa! That's a lot of name changes!";
        }
    }
}
