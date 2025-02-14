// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract notebook {
    struct Note {
        string content;
        uint256 timestamp;
    }

    mapping(address => Note[]) public notebooks;

    function createNotes(string memory note) public {
        Note memory newNote = Note({content: note, timestamp: block.timestamp});
        notebooks[msg.sender].push(newNote);
    }

    function getNotes(address owner, uint i) public view returns (Note memory) {
        return notebooks[owner][i];
    }

    function allNotes(address owner) public view returns (Note[] memory) {
        return notebooks[owner];
    }
}
