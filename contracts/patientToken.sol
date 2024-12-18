// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./recordToken.sol";
import "./accessControl.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";


contract patientToken is ERC721, Ownable {
    mapping (address => uint256) public patient_count; //Mapping for the index of patient based on address
    PatientRecord[] public patientRecords; 
    address[] public authorizedDoctor;

    constructor() ERC721("PatientRecord", "PRC") {
    }
    struct PatientRecord (
        string name;
        uint256 age;
        string gender;
        string patient_home_address;
        string[] _hashed_record_array
    )
    // Access control modifiers
    modifier onlyPatient() {
        require(hasRole(accessControl.PATIENT_ROLE, msg.sender));
        _;
    }

    modifier onlyAuthorizedDoctor() {
        require(hasRole(accessControl.AUTH_DOC_ROLE, msg.sender));
        _;
    }

    function addAuthorizedDoctor(address _authorizedDoctor) public onlyOwner {
        accessControl.addDoctor(_authorizedDoctor);
    }

    function addPatient(address _patientAddress) public onlyAuthorizedDoctor {
        accessControl.addPatient(_patientAddress);
    }

    //Mint and burn patient token
    function newPatient(address patient_address,string memory _name, uint256 _age, string memory _gender, string memory _patient_home_address) public onlyAuthorizedDoctor{
        
        patientRecords[patient_count[patient_address]] = PatientRecord({
            name: _name,
            age: _age,
            gender: _gender, 
            patient_home_address: _patient_home_address, 
            _hashed_record_array: []});
        _safeMint(patient_address, patient_count[msg.sender]);
        grantRole("patient", patient_address);
    }

    function deletePatientRecord(address patient_address) external onlyPatient{
        _safeburn(patient_address, patient_count[msg.sender]);
    }

    //Update  patient info
    function changeName(address patient_address, string memory _name) public onlyPatient{
        patientRecords[patient_count[patient_address]].name = _name;
    }
    function changeAge(address patient_address, uint256 _age) public onlyPatient{
        patientRecords[patient_count[patient_address]].age = _age;
    }
    function changeGender(address patient_address, string memory _gender) public onlyPatient{
        patientRecords[patient_count[patient_address]].gender = _gender;
    }
    function changePatientHomeAddress(address patient_address, string memory _patient_home_address) public onlyPatient{
        patientRecords[patient_count[patient_address]].patient_home_address = _patient_home_address;
    }
    
    //Patient record functions
    function newRecord(address patient_address, string memory _cid,string memory _notes,address _doctorAddress) public onlyPatient{
        recordTokenNew = recordToken.newRecord(patient_address, _cid,_notes,_doctorAddress);
        patientRecords[patient_count[patient_address]]._hashed_record.push(recordTokenNew);
    }

    function deleteRecord(address patient_address, string memory _record_hashed) public onlyPatient{
        recordToken.deletePatientRecord(patient_address, _record_hashed);
        patientRecords[patient_count[patient_address]]._hashed_record.pop(_record_hashed);
    }

    function listAllRecords(address patient_address) public onlyPatient returns (string[]){
        return patientRecords[patient_count[patient_address]]._hashed_record_array;
    }

    function readRecord(address patient_address,string memory _hashed_record) external onlyPatient{
        return recordToken.readPatientRecord(_hashed_record);
    }

    // Check for token existence
    function checkPatientExistence(address patient_address) public view returns (bool) {
        return patientRecords[patient_count[patient_address]] != null;
    }
}