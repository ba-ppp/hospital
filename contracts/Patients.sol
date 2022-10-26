// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Patients {
    struct MedicalHistoryStruct {
        uint256 timestamp;
        address doctorAddress;
        string symtom;
        string diseaseName;
        string diseaseDescription;
        string treatmentInfo;
        string treatmentResult;
        string diseaseStatus;
        string documentLink;
    }

    struct PatientStruct {
        string name;
        string birth;
        string phone;
        string email;
        string height;
        string weight;
        string bloodType;
        string healthStatus;
        uint256 medicalHistoryCount;
        MedicalHistoryStruct[] medicalHistory;
    }

    // STORAGE
    mapping(address => PatientStruct) patients;

    address[] a;
    uint count;

    // user create new patient
    function createNewPatient(
        string memory name,
        string memory birth,
        string memory phone,
        string memory email,
        string memory height,
        string memory weight,
        string memory bloodType,
        string memory healthStatus
    ) public returns (address) {
        // create new patient with public address
        PatientStruct storage p = patients[msg.sender];

        p.name = name;
        p.birth = birth;
        p.phone = phone;
        p.email = email;
        p.height = height;
        p.weight = weight;
        p.bloodType = bloodType;
        p.healthStatus = healthStatus;

        a.push(msg.sender);
        count += 1;
        return msg.sender;
    }

    function getAddress() public view returns (address) {
        return a[count - 1];
    }

    // patient edit information
    function editInfoPatient(
        string memory name,
        string memory birth,
        string memory phone,
        string memory email,
        string memory height,
        string memory weight,
        string memory bloodType,
        string memory healthStatus
    ) public {
        PatientStruct storage p = patients[msg.sender];

        p.name = name;
        p.birth = birth;
        p.phone = phone;
        p.email = email;
        p.height = height;
        p.weight = weight;
        p.bloodType = bloodType;
        p.healthStatus = healthStatus;
    }

    // doctor add new medical for patient
    function addMedicalHistory(
        address patientAddress,
        string memory symtom,
        string memory diseaseName,
        string memory diseaseDescription,
        string memory treatmentInfo,
        string memory treatmentResult,
        string memory diseaseStatus,
        string memory documentLink
    ) public {
        PatientStruct storage p = patients[patientAddress];

        MedicalHistoryStruct memory newMedicalHistory = MedicalHistoryStruct({
            timestamp: block.timestamp,
            doctorAddress: msg.sender,
            symtom: symtom,
            diseaseName: diseaseName,
            diseaseDescription: diseaseDescription,
            treatmentInfo: treatmentInfo,
            treatmentResult: treatmentResult,
            diseaseStatus: diseaseStatus,
            documentLink: documentLink
        });

        p.medicalHistory.push(newMedicalHistory);
    }

    function getPatientByPublicAddress() public view returns (PatientStruct memory) {
        return patients[msg.sender];
    }



}
