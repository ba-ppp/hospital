// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Doctors {
    struct DoctorStruct {
        string name;
        string gender;
        uint birth;
        string phone;
        string email;
        string degrees;
        string rank;
        string[] workPlaces;
        string[] speciality;
        uint experienceYears;
        string profileLink;
    }

    mapping(address => DoctorStruct) doctors;

    function createNewDoctor(
        string memory name,
        string memory gender,
        uint birth,
        string memory phone,
        string memory email,
        string memory degrees,
        string memory rank,
        string[] memory workPlaces,
        string[] memory speciality,
        uint experienceYears,
        string memory profileLink
    ) public {
        DoctorStruct storage d = doctors[msg.sender];

        d.name = name;
        d.gender = gender;
        d.birth = birth;
        d.phone = phone;
        d.email = email;
        d.degrees = degrees;
        d.rank = rank;
        
        for (uint i = 0; i < workPlaces.length; i++) {
            d.workPlaces.push(workPlaces[i]);
        }

        for (uint i = 0; i < speciality.length; i++) {
            d.speciality.push(speciality[i]);
        }

        d.experienceYears = experienceYears;
        d.profileLink = profileLink;
    }

    function getDoctorByCurrentAddress() public view returns(DoctorStruct memory) {
        return doctors[msg.sender];
    }
}