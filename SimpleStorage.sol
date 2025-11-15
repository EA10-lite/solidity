//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract SimpleStorage {
    uint public myFavoriteNumber;
    
    struct Person {
        uint256 age;
        string name;
    }

    Person[] public people;

    mapping(string => uint256) public users;

    function set(uint number) public {
        myFavoriteNumber = number;
    }

    function addPeople(string memory _name, uint256 _age) public {
        people.push(Person(_age, _name));
        users[_name] = _age;
    }
}