import logo from './logo.svg';
import './App.css';

import React from 'react';

function App() {
  // 👤 Office data list
  const officeList = [
    {
      name: "Tech Park Alpha",
      rent: 45000,
      address: "No.12, MG Road, Bengaluru",
      image: "https://gustavconcept.com/cdn/shop/articles/QIC_SYD_Unispace_QIC_resized_2_copy.jpg?v=1691409476"
    },
    {
      name: "Innovation Hub",
      rent: 75000,
      address: "Sector 21, Gurugram",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9M7_p6KfGAnQ2lr4pRqPIC-TmrGyhIg6uGA&s"
    },
    {
      name: "Startup Bay",
      rent: 60000,
      address: "Hitech City, Hyderabad",
      image: "https://media.istockphoto.com/id/1141421616/photo/this-office-space-is-filled-with-productivity.jpg?s=612x612&w=0&k=20&c=ka6rGPcVkhjC2cG-ICEQaE7mzufJ253bngJPahvBlCg="
    }
  ];

  // 👀 JSX output
  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1 style={{ color: "#333", textAlign: "center" }}>
        Office Space Rental Portal
      </h1>

      {/* Loop through all office data */}
      {officeList.map((office, index) => (
        <div
          key={index}
          style={{
            border: "1px solid #ccc",
            padding: "15px",
            margin: "15px auto",
            maxWidth: "600px",
            borderRadius: "10px",
            backgroundColor: "#f9f9f9"
          }}
        >
          <img
            src={office.image}
            alt={office.name}
            style={{ width: "100%", height: "auto", borderRadius: "5px" }}
          />
          <h2>{office.name}</h2>
          <p><strong>Address:</strong> {office.address}</p>
          <p>
            <strong>Rent:</strong>{' '}
            <span
              style={{
                color: office.rent < 60000 ? "red" : "green",
                fontWeight: "bold"
              }}
            >
              ₹{office.rent.toLocaleString()}
            </span>
          </p>
        </div>
      ))}
    </div>
  );
}

export default App;

