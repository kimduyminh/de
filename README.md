
# Decentralized Health Record Management System

## Introduction

The Decentralized Health Record Management System is a blockchain-based framework for securely managing patient information and health records. It employs a combination of three contracts to ensure privacy, transparency, and immutability:

1. **PatientToken**: Manages patient profiles as unique ERC-721 tokens, allowing for secure identification and interaction.
2. **RecordToken**: Handles individual health records, linking them to patients with immutable metadata.
3. **AccessControl**: Implements role-based permissions to regulate access for patients, doctors, and administrators.

---

## Overview of Contracts

### **PatientToken**
- **Purpose**: Represents patients as ERC-721 tokens.
- **Key Features**:
  - Create, update, and delete patient profiles.
  - Associate health records with patient profiles.
  - Enforce access control for operations via role-based restrictions.

### **RecordToken**
- **Purpose**: Manages health records associated with patients.
- **Key Features**:
  - Create and manage individual health records.
  - Securely store metadata like timestamps, notes, and doctor details.
  - Integrate seamlessly with the `PatientToken` contract.

### **AccessControl**
- **Purpose**: Provides role-based access management.
- **Key Features**:
  - Define roles for patients (`PATIENT_ROLE`) and doctors (`AUTH_DOC_ROLE`).
  - Ensure only authorized individuals can access and modify data.

---

## Features
- **Patient-Centric Design**:
  - Patients have full control over their profiles and records.
  - Secure access for authorized healthcare professionals.
  
- **Immutable Records**:
  - Health records are uniquely hashed and securely stored on the blockchain.

- **Role-Based Access**:
  - Fine-grained permission control to prevent unauthorized actions.

- **Interoperability**:
  - Seamless integration between `PatientToken` and `RecordToken`.

---

## Usage
1. **Deploy AccessControl**:
   - Initialize and set roles for the admin.
   
2. **Deploy RecordToken**:
   - Link health records with patients.

3. **Deploy PatientToken**:
   - Manage patient profiles and integrate access control and health records.

---

## Upcomming features:
1. **Dapp Development**: Deploy fully functional web3 application.
2. **Responsive data**: Deploying new contract for fetching new data about general health data and managing different views for each roles

---

## License

This system is licensed under the **MIT License**. All contracts are designed with extensibility and security in mind.
