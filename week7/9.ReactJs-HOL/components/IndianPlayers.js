import React from 'react';

function IndianPlayers() {
  const T20Players = ['Kohli', 'Rohit', 'Pant', 'Bumrah'];
  const RanjiPlayers = ['Pujara', 'Rahane', 'Saha'];

  // Merge arrays using ES6 spread
  const allPlayers = [...T20Players, ...RanjiPlayers];

  // Separate even and odd players using array destructuring
  const oddTeam = allPlayers.filter((_, i) => i % 2 !== 0);
  const evenTeam = allPlayers.filter((_, i) => i % 2 === 0);

  return (
    <div>
      <h2>All Indian Players</h2>
      <p>{allPlayers.join(', ')}</p>

      <h3>Odd Team Players</h3>
      <ul>
        {oddTeam.map((name, index) => (
          <li key={index}>{name}</li>
        ))}
      </ul>

      <h3>Even Team Players</h3>
      <ul>
        {evenTeam.map((name, index) => (
          <li key={index}>{name}</li>
        ))}
      </ul>
    </div>
  );
}

export default IndianPlayers;
