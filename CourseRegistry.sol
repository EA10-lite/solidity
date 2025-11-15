// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import { StudentRegistry } from "./StudentRegistry.sol";

contract CourseRegistry {
    struct Course {
        string code;
        string title;
        uint units;
        bool isCompulsory;
    }

    Course[] public courses;
    mapping(uint => address[]) public courseRegistrations;


    function addCourse(
        string memory _code, 
        string memory _title, 
        uint _units, 
        bool compulsory
    ) public {
        for (uint i = 0; i < courses.length; i++) {
            require(!compareStrings(_code, courses[i].code), "Course already exists");
        }

        courses.push(Course(_code, _title, _units, compulsory));
    }

    function getAllCourses() public view returns (Course[] memory) {
        return courses;
    }


    function getCourseByCode(string memory _code) public view returns (Course memory) {
        
    }

    function registerForCourse() public {}

    function getStudentsForRegisteredCourse() public {}


    function compareStrings(string memory a, string memory b) internal pure returns (bool) {
        return keccak256(abi.encodePacked(a)) == keccak256(abi.encodePacked(b));
    }
}