import React from 'react';

function Guest() {
  return (
    <div>
      <h2>You are logged out. Welcome, Guest!</h2>
      <p>You can browse available flight details.</p>
      <p>Login to book tickets!</p>
      <ul>
        <li>Chennai → Delhi (INR 5,000)</li>
        <li>Mumbai → Bangalore (INR 4,800)</li>
        <li>Kolkata → Hyderabad (INR 5,200)</li>
      </ul>
    </div>
  );
}

export default Guest;
