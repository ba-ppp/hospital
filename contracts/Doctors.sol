// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

interface PatientInterface {
    function addMedicalHistory(
        address patientAddress,
        string memory symtom,
        string memory diseaseName,
        string memory diseaseDescription,
        string memory treatmentInfo,
        string memory treatmentResult,
        string memory diseaseStatus,
        string memory documentLink
    ) external;
}

contract Doctors {
    struct DoctorStruct {
        string name;
        string gender;
        uint256 birth;
        string phone;
        string email;
        string degrees;
        string rank;
        string[] workPlaces;
        string[] speciality;
        uint256 experienceYears;
        string profileLink;
    }

    address public constant PATIENT_CONTRACT =
        0xaE036c65C649172b43ef7156b009c6221B596B8b;
    PatientInterface patientContract = PatientInterface(PATIENT_CONTRACT);

    mapping(address => DoctorStruct) doctors;

    function createNewDoctor(
        string memory name,
        string memory gender,
        uint256 birth,
        string memory phone,
        string memory email,
        string memory degrees,
        string memory rank,
        string[] memory workPlaces,
        string[] memory speciality,
        uint256 experienceYears,
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

        for (uint256 i = 0; i < workPlaces.length; i++) {
            d.workPlaces.push(workPlaces[i]);
        }

        for (uint256 i = 0; i < speciality.length; i++) {
            d.speciality.push(speciality[i]);
        }

        d.experienceYears = experienceYears;
        d.profileLink = profileLink;
    }

    function getDoctorByPublicAddress(address doctorAddress) public view returns (DoctorStruct memory) {
        return doctors[doctorAddress];
    }

    function getDoctorByCurrentAddress()
        public
        view
        returns (DoctorStruct memory)
    {
        return doctors[msg.sender];
    }

    function addPatientMedicalHistory(
        address patientAddress,
        string memory symtom,
        string memory diseaseName,
        string memory diseaseDescription,
        string memory treatmentInfo,
        string memory treatmentResult,
        string memory diseaseStatus,
        string memory documentLink
    ) public {
        patientContract.addMedicalHistory(
            patientAddress,
            symtom,
            diseaseName,
            diseaseDescription,
            treatmentInfo,
            treatmentResult,
            diseaseStatus,
            documentLink
        );
    }

    function editDoctorInfo(
        string memory name,
        string memory gender,
        uint256 birth,
        string memory phone,
        string memory email,
        string memory degrees,
        string memory rank,
        string[] memory workPlaces,
        string[] memory speciality,
        uint256 experienceYears,
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

        for (uint256 i = 0; i < workPlaces.length; i++) {
            d.workPlaces[i] = workPlaces[i];
        }

        for (uint256 i = 0; i < speciality.length; i++) {
            d.speciality[i] = speciality[i];
        }

        d.experienceYears = experienceYears;
        d.profileLink = profileLink;
    }
}
