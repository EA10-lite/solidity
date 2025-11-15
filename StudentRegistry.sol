// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract StudentRegistry {
    // Define student type
    struct Student {
        uint id;
        string name;
        uint age;
    }

    // map each student to an address
    mapping(address => Student[]) private students;

    // to register a student, check if the ID doesn't belong to another student that exists on the list.
    function registerStudent(uint _id, string memory _name, uint _age) public {
        for (uint i = 0; i < students[msg.sender].length; i++) {
            require(students[msg.sender][i].id != _id, "ID already exists");
        }

        students[msg.sender].push(Student(_id, _name, _age));
    }

    function getStudents() public view returns (Student[] memory) {
        return students[msg.sender];
    }

    function getStudentById(uint _id) public view returns (Student memory) {
        for (uint i = 0; i < students[msg.sender].length; i++) {
            if(students[msg.sender][i].id == _id) {
                return students[msg.sender][i];
            }
        }

        revert("Student not found!");
    }

    function updateStudent(uint _id, string memory _name, uint _age) public {
        for(uint i = 0; i < students[msg.sender].length; i++) {
            if(students[msg.sender][i].id == _id) {
                students[msg.sender][i].name = _name;
                students[msg.sender][i].age = _age;

                return;
            }
        }

        revert("Student not found!");
    }

    function deleteStudentById(uint _id) public {
        for (uint i = 0; i < students[msg.sender].length; i++) {
            if(students[msg.sender][i].id == _id) {
                students[msg.sender][i] = students[msg.sender][students[msg.sender].length - 1];
                students[msg.sender].pop();

                return;
            }
        }

        revert("Student not found!");
    }
}