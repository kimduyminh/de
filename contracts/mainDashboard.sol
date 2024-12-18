// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
import "contracts/recordToken.sol";
import "contracts/patientToken.sol";
import "./accessControl.sol";
import "./patientToken.sol";

contract mainDashboard {
    constructor(){

    }
    // Guest dashboard
    function newPatient(address patient_address,string memory _name, uint256 _age, string memory _gender, string memory _patient_home_address) public onlyAuthorizedDoctor{
        patientToken.newPatient(patient_address, _name, _age, _gender, _patient_home_address);
    }

    function checkIfPatientExists(address patient_address) public view returns (bool){
        patientToken.checkIfPatientExists(patient_address);
    }
    
    // Patient dashboard
    function loadPatientInfos() public{
        return patientToken.patientRecords[patientToken.patient_count[msg.sender]];
    }
}