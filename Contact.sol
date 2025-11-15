// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Contact {
    struct User {
        string name;
        string phone;
    }

    User[] public users;

    mapping(address => User[]) private contacts;


    function addContact(string memory _name, string memory _phone) public {
        contacts[msg.sender].push(User(_name, _phone));
    }

    function getContacts() public view returns (User[] memory) {
        return contacts[msg.sender];
    }


    function deleteContact(uint index) public {
        require(index < contacts[msg.sender].length, "Invalid length");

        contacts[msg.sender][index] = contacts[msg.sender][contacts[msg.sender].length - 1];
        contacts[msg.sender].pop();
    }

    function updateContact(uint index, string memory _name, string memory _phone) public {
        require(index < contacts[msg.sender].length, "Invalid index");
        
        contacts[msg.sender][index].name = _name;
        contacts[msg.sender][index].phone = _phone;
    }
}