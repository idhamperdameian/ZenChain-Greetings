// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

contract ZenGreetings {
    string public name;
    address public owner;
    uint256 public nameChangeCount; // Added: counter for fun!
    uint256 public lastChangeDate; // Added: timestamp of last name change
    string[] public nameHistory; // Added: history of all names

    mapping(address => string) public customGreeting; // Added: Custom greetings per user
    mapping(address => bool) public hasLiked; // Added: tracks who liked
    uint256 public totalLikes; // Added: total likes

    event NameChanged(string oldName, string newName, uint256 totalChanges, uint256 changeTime);
    event GreetingLiked(address user);
    event GreetingUnliked(address user);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    constructor(string memory initialName) {
        name = initialName;
        owner = msg.sender;
        nameChangeCount = 0; // Initialize counter
        lastChangeDate = block.timestamp; // Initialize with contract creation time
        nameHistory.push(initialName); // Store the initial name in history
    }

    function changeName(string memory newName) external onlyOwner {
        string memory oldName = name;
        name = newName;
        nameChangeCount += 1; // Increment counter
        lastChangeDate = block.timestamp; // Update timestamp
        nameHistory.push(newName); // Add to history

        emit NameChanged(oldName, newName, nameChangeCount, lastChangeDate); // Updated event
    }

    function greet() external view returns (string memory) {
        return string(abi.encodePacked("Hello, ", name, "!"));
    }

    // New: set your personal greeting message
    function setCustomGreeting(string memory message) external {
        customGreeting[msg.sender] = message;
    }

    // New: returns custom greeting if set, else default greeting
    function getMyGreeting() external view returns (string memory) {
        string memory message = customGreeting[msg.sender];
        if (bytes(message).length == 0) {
            return string(abi.encodePacked("Hello, ", name, "!")); // fallback
        }
        return string(abi.encodePacked(message, ", ", name, "!"));
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

    function getLastChangeDate() external view returns (uint256) {
        return lastChangeDate;
    }

    function getNameHistoryLength() external view returns (uint256) {
        return nameHistory.length;
    }

    function getNameAtIndex(uint256 index) external view returns (string memory) {
        require(index < nameHistory.length, "Index out of bounds");
        return nameHistory[index];
    }

    // 💚 Like the greeting
    function likeGreeting() external {
        require(!hasLiked[msg.sender], "You already liked this greeting.");
        hasLiked[msg.sender] = true;
        totalLikes += 1;

        emit GreetingLiked(msg.sender);
    }

    // 💔 Unlike the greeting
    function unlikeGreeting() external {
        require(hasLiked[msg.sender], "You haven't liked this greeting yet.");
        hasLiked[msg.sender] = false;
        totalLikes -= 1;

        emit GreetingUnliked(msg.sender);
    }
}
