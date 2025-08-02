import React from 'react';

function ListofPlayers() {
  const players = [
    { name: 'Virat Kohli', score: 85 },
    { name: 'Rohit Sharma', score: 90 },
    { name: 'Shikhar Dhawan', score: 45 },
    { name: 'KL Rahul', score: 30 },
    { name: 'Shreyas Iyer', score: 75 },
    { name: 'Rishabh Pant', score: 60 },
    { name: 'Jasprit Bumrah', score: 25 },
    { name: 'Hardik Pandya', score: 78 },
    { name: 'Mohammed Shami', score: 80 },
    { name: 'Ravindra Jadeja', score: 66 },
    { name: 'Yuzvendra Chahal', score: 70 }
  ];

  // Filter players with score < 70 using arrow function
  const lowScorers = players.filter(player => player.score < 70);

  return (
    <div>
      <h2>All Players</h2>
      <ul>
        {players.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>

      <h3>Players with score less than 70</h3>
      <ul>
        {lowScorers.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
}

export default ListofPlayers;
