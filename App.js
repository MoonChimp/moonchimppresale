import React, { useState } from 'react';
import './App.css';

function App() {
  const [balance, setBalance] = useState(100);
  const [miningStatus, setMiningStatus] = useState('idle');
  const [gameHistory, setGameHistory] = useState([]);

  // Simulate mining crypto
  const startMining = () => {
    setMiningStatus('mining');
    
    // Simulate mining process with a timer
    setTimeout(() => {
      const mined = Math.floor(Math.random() * 10) + 1;
      setBalance(prevBalance => prevBalance + mined);
      setMiningStatus('idle');
      
      // Add to history
      setGameHistory(prevHistory => [
        ...prevHistory,
        `Mined ${mined} MoonCoins!`
      ]);
    }, 3000);
  };

  // Simulate a game where user can win or lose crypto
  const playGame = () => {
    // Simple 50/50 game
    const win = Math.random() > 0.5;
    
    if (win) {
      const winAmount = Math.floor(Math.random() * 20) + 5;
      setBalance(prevBalance => prevBalance + winAmount);
      setGameHistory(prevHistory => [
        ...prevHistory,
        `Won ${winAmount} MoonCoins in the game!`
      ]);
    } else {
      const loseAmount = Math.floor(Math.random() * 10) + 1;
      setBalance(prevBalance => prevBalance - loseAmount);
      setGameHistory(prevHistory => [
        ...prevHistory,
        `Lost ${loseAmount} MoonCoins in the game.`
      ]);
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        <h1>MoonChimp Crypto Game</h1>
        <div className="balance-container">
          <h2>Your Balance: {balance} MoonCoins</h2>
        </div>
        
        <div className="actions-container">
          <button 
            onClick={startMining} 
            disabled={miningStatus === 'mining'}
            className="action-button mine-button"
          >
            {miningStatus === 'mining' ? 'Mining...' : 'Mine MoonCoins'}
          </button>
          
          <button 
            onClick={playGame} 
            disabled={balance <= 0}
            className="action-button game-button"
          >
            Play Game
          </button>
        </div>
        
        <div className="history-container">
          <h3>Game History</h3>
          <div className="history-entries">
            {gameHistory.length === 0 ? (
              <p>No activity yet</p>
            ) : (
              gameHistory.slice().reverse().map((entry, index) => (
                <div key={index} className="history-entry">
                  {entry}
                </div>
              ))
            )}
          </div>
        </div>
      </header>
    </div>
  );
}

export default App;