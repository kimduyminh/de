// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
import "@openzeppelin/contracts/access/AccessControl.sol";

contract accessControl is AccessControl{
    uint256 public constant PATIENT_ROLE = keccak256("patient");
    uint256 public constant AUTH_DOC_ROLE = keccak256("auth_doc");
    
    constructor() AccessControl() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function addDoctor(address _doctorAddress) external onlyRole(DEFAULT_ADMIN_ROLE){
        _setupRole(AUTH_DOC_ROLE, _doctorAddress);
    }
    
    function addPatient(address _patientAddress) external onlyRole(DEFAULT_ADMIN_ROLE,AUTH_DOC_ROLE){
        _setupRole(PATIENT_ROLE, _patientAddress);
    }
}