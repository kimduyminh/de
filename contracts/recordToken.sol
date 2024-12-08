// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "contract/patientToken.sol";

contract RecordToken is ERC721, Ownable {
    PatientRecord[] public patientRecords;
    mapping (PatientRecord => uint256) public patientRecordsToUint256;
    constructor() ERC721("HealthRecord", "HRC") {
    }
    struct PatientRecord (
        address _patient_address;
        string _hashed_record;
        timestamp _timestamp;
        string _notes;
        address _doctorAddress;
    )
    mapping (address => PatientRecord[]) public patientRecords;
    
    function newRecord(address patient_address,string memory _cid,string memory _notes,address _doctorAddress) external onlyPatient returns (string) {
        uint256 _hashed_record = keccak256(abi.encodePacked(block.timestamp, block.number,_cid));
        patientRecords[patient_address].push(PatientRecord(patient_address, _hashed_record,block._timestamp,_notes,_doctorAddress));
        _safemint(patient_address, patientRecords[patient_address]);
        returns _hashed_record;
    }

    function deletePatientRecord(address patient_address,string memory _hashed_record) external onlyPatient{
        _safeburn(patient_address, patientRecords[patient_address]);
        patientRecords[patient_address].pop();
    }
    function readPatientRecord(address patient_address,string memory _hashed_record) external onlyPatient{
        return patientRecords[patient_address][_hashed_record];
    }
    
}