// Example: Dynamic Patient List
document.getElementById('add-patient-btn').addEventListener('click', () => {
    const table = document.getElementById('patient-table');
    const newRow = table.insertRow();
  
    const idCell = newRow.insertCell(0);
    const nameCell = newRow.insertCell(1);
    const ageCell = newRow.insertCell(2);
    const conditionCell = newRow.insertCell(3);
  
    idCell.innerText = prompt("Enter Patient ID:");
    nameCell.innerText = prompt("Enter Patient Name:");
    ageCell.innerText = prompt("Enter Patient Age:");
    conditionCell.innerText = prompt("Enter Condition:");
  
    alert("Patient Added!");
  });
  
  // Example: Handle Appointment Form
  document.getElementById('appointment-form').addEventListener('submit', (event) => {
    event.preventDefault();
  
    const patientName = document.getElementById('patient-name').value;
    const doctorName = document.getElementById('doctor-name').value;
    const appointmentDate = document.getElementById('appointment-date').value;
  
    alert(`Appointment scheduled for ${patientName} with ${doctorName} on ${appointmentDate}`);
  });
document.getElementById('metamask-login-btn').addEventListener('click', async () => {
    
})