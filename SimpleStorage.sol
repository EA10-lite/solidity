// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        string name;
        uint256 favoriteNumber;
    }

    Person[] public listOfPeople;


    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_name, _favoriteNumber));
    }

    function get() public view returns(uint256) {
        return myFavoriteNumber;
    }
}