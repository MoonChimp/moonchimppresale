<div className="stat">
            <span className="statValue">10K+</span>
            <span className="statLabel">NFTs Minted</span>
          </div>
          <div className="stat">
            <span className="statValue">$2M+</span>
            <span className="statLabel">Total Volume</span>
          </div>
        </div>
      </div>
      <div className="heroImage">
        {/* 3D chimp model or animated space scene */}
      </div>
    </div>
  );
};

export default HeroSection;
"@ | Out-File -FilePath "$projectRoot\src\components\HeroSection.js" -Encoding UTF8

# Create remaining components in order
$components = @{
    "FeaturesSection.js" = @"
import React from 'react';
import './FeaturesSection.css';

const FeaturesSection = () => {
  const features = [
    {
      icon: '🚀',
      title: 'Space Exploration',
      description: 'Navigate through stunning cosmic environments and discover new worlds'
    },
    {
      icon: '🔫',
      title: 'Battle Royale',
      description: 'Compete in intense multiplayer battles with your customized chimps'
    },
    {
      icon: '💎',
      title: 'NFT Collectibles',
      description: 'Collect, trade, and upgrade unique chimp NFTs with special abilities'
    },
    {
      icon: '💰',
      title: 'Play to Earn',
      description: 'Earn CHIMP tokens through gameplay and stake for passive rewards'
    },
    {
      icon: '🛠️',
      title: 'Customization',
      description: 'Upgrade your chimp with unique suits, weapons, and equipment'
    },
    {
      icon: '🌍',
      title: 'Cross-Platform',
      description: 'Play on web, mobile, and experience AR features on the go'
    }
  ];

  return (
    <div className="features">
      <div className="featuresContainer">
        <h2 className="sectionTitle">Game Features</h2>
        <p className="sectionSubtitle">Experience the future of gaming</p>
        <div className="featuresGrid">
          {features.map((feature, index) => (
            <div key={index} className="featureCard">
              <div className="featureIcon">{feature.icon}</div>
              <h3>{feature.title}</h3>
              <p>{feature.description}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default FeaturesSection;
"@

    "AboutSection.js" = @"
import React from 'react';
import './AboutSection.css';

const AboutSection = () => {
  return (
    <div className="about">
      <div className="aboutContainer">
        <div className="aboutContent">
          <div className="aboutText">
            <h2 className="sectionTitle">The MoonChimp Story</h2>
            <p className="aboutParagraph">
              In the year 2142, humanity discovered an ancient alien artifact on the moon.
              This artifact transformed Earth's primates into highly intelligent beings,
              creating the elite M.C. Corp - Moon Chimp Corporation.
            </p>
            <p className="aboutParagraph">
              These enhanced chimps, equipped with advanced Halo Spartan-style suits,
              now serve as humanity's greatest explorers and defenders in the vast cosmos.
              Each chimp possesses unique abilities and characteristics, making them
              valuable assets in the fight for cosmic dominance.
            </p>
            <p className="aboutParagraph">
              Join the M.C. Corp today and lead your chimp squad to victory across
              the galaxy. The universe awaits your command!
            </p>
            <div className="aboutStats">
              <div className="aboutStat">
                <h3>100+</h3>
                <p>Unique Chimp Types</p>
              </div>
              <div className="aboutStat">
                <h3>50+</h3>
                <p>Space Missions</p>
              </div>
              <div className="aboutStat">
                <h3>1M+</h3>
                <p>CHIMP Tokens Staked</p>
              </div>
            </div>
          </div>
          <div className="aboutImage">
            {/* Chimp character showcase */}
          </div>
        </div>
      </div>
    </div>
  );
};

export default AboutSection;
"@

    "GameIntegration.js" = @"
import React, { useState, useEffect, useRef } from 'react';
import './GameIntegration.css';

const GameIntegration = () => {
  const [gameLoaded, setGameLoaded] = useState(false);
  const [loading, setLoading] = useState(false);
  const [loadingProgress, setLoadingProgress] = useState(0);
  const gameContainerRef = useRef(null);

  const loadGame = () => {
    setLoading(true);
    
    // Simulate Unity WebGL loading
    const script = document.createElement('script');
    script.src = '/build/MoonChimp.framework.js';
    script.async = true;
    
    script.onload = () => {
      // Initialize Unity instance
      if (window.createUnityInstance) {
        const canvas = document.createElement('canvas');
        canvas.id = 'unity-canvas';
        gameContainerRef.current.appendChild(canvas);
        
        window.createUnityInstance(canvas, {
          dataUrl: '/build/MoonChimp.data',
          frameworkUrl: '/build/MoonChimp.framework.js',
          codeUrl: '/build/MoonChimp.wasm',
          streamingAssetsUrl: 'StreamingAssets',
          companyName: 'MoonChimp Studios',
          productName: 'MoonChimp.io',
          productVersion: '1.0.0',
          onProgress: (progress) => {
            setLoadingProgress(progress * 100);
          }
        }).then((unityInstance) => {
          setGameLoaded(true);
          setLoading(false);
        }).catch((error) => {
          console.error('Unity loading error:', error);
          setLoading(false);
        });
      }
    };
    
    document.body.appendChild(script);
  };

  const toggleFullscreen = () => {
    const canvas = document.getElementById('unity-canvas');
    if (canvas && canvas.requestFullscreen) {
      canvas.requestFullscreen();
    }
  };

  return (
    <div className="gameIntegration">
      <h2 className="sectionTitle">Play MoonChimp</h2>
      <p className="sectionSubtitle">Launch into the ultimate space adventure</p>
      
      {!gameLoaded && !loading && (
        <button className="playButton" onClick={loadGame}>
          Launch Game
        </button>
      )}
      
      {loading && (
        <div className="loadingBar">
          <div className="progress" style={{ width: `{loadingProgress}%` }} />
          <p className="loadingText">Loading: {loadingProgress.toFixed(0)}%</p>
        </div>
      )}
      
      <div className="gameContainer" ref={gameContainerRef}>
        {gameLoaded && (
          <button className="fullscreenButton" onClick={toggleFullscreen}>
            Fullscreen
          </button>
        )}
      </div>
      
      {!gameLoaded && (
        <div className="controlsInfo">
          <h3>Game Controls</h3>
          <p>WASD - Move | Mouse - Look | Space - Jump | E - Interact</p>
          <p>Tab - Inventory | ESC - Menu</p>
        </div>
      )}
    </div>
  );
};

export default GameIntegration;
"@

    "NFTMarketplace.js" = @"
import React, { useState, useEffect } from 'react';
import Web3 from 'web3';
import './NFTMarketplace.css';

const NFTMarketplace = () => {
  const [web3, setWeb3] = useState(null);
  const [account, setAccount] = useState(null);
  const [nfts, setNfts] = useState([]);
  const [filter, setFilter] = useState('all');

  useEffect(() => {
    loadWeb3();
    loadNFTs();
  }, []);

  const loadWeb3 = async () => {
    if (window.ethereum) {
      const web3Instance = new Web3(window.ethereum);
      setWeb3(web3Instance);
      
      try {
        await window.ethereum.request({ method: 'eth_requestAccounts' });
        const accounts = await web3Instance.eth.getAccounts();
        setAccount(accounts[0]);
      } catch (error) {
        console.error('User denied account access');
      }
    }
  };

  const loadNFTs = async () => {
    // Sample NFT data - replace with actual API call
    const sampleNFTs = [
      {
        id: 1,
        name: 'Alpha Chimp Commander',
        rarity: 'Legendary',
        price: '2.5 ETH',
        image: '/images/chimp1.jpg',
        attributes: ['Leadership +10', 'Combat +8', 'Speed +7']
      },
      {
        id: 2,
        name: 'Space Explorer Chimp',
        rarity: 'Epic',
        price: '1.2 ETH',
        image: '/images/chimp2.jpg',
        attributes: ['Exploration +9', 'Tech +7', 'Stealth +6']
      },
      {
        id: 3,
        name: 'Battle Chimp Warrior',
        rarity: 'Rare',
        price: '0.8 ETH',
        image: '/images/chimp3.jpg',
        attributes: ['Strength +8', 'Defense +7', 'Accuracy +6']
      }
    ];
    setNfts(sampleNFTs);
  };

  const buyNFT = async (nftId) => {
    if (!web3 || !account) {
      alert('Please connect your wallet');
      return;
    }
    
    // Implement NFT purchase logic here
    console.log(`Buying NFT {nftId}`);
  };

  const getRarityColor = (rarity) => {
    switch(rarity) {
      case 'Legendary': return '#ff8c00';
      case 'Epic': return '#a335ee';
      case 'Rare': return '#0070ff';
      default: return '#1eff00';
    }
  };

  return (
    <div className="nftMarketplace">
      <div className="marketplaceContainer">
        <h2 className="sectionTitle">NFT Marketplace</h2>
        <p className="sectionSubtitle">Collect and trade unique Space Chimps</p>
        
        <div className="filterButtons">
          <button 
            className={filter === 'all' ? 'active' : ''} 
            onClick={() => setFilter('all')}
          >
            All NFTs
          </button>
          <button 
            className={filter === 'legendary' ? 'active' : ''} 
            onClick={() => setFilter('legendary')}
          >
            Legendary
          </button>
          <button 
            className={filter === 'epic' ? 'active' : ''} 
            onClick={() => setFilter('epic')}
          >
            Epic
          </button>
          <button 
            className={filter === 'rare' ? 'active' : ''} 
            onClick={() => setFilter('rare')}
          >
            Rare
          </button>
        </div>
        
        <div className="nftGrid">
          {nfts.map(nft => (
            <div key={nft.id} className="nftCard">
              <div className="nftImage">
                <img src={nft.image} alt={nft.name} />
                <span 
                  className="rarityBadge" 
                  style={{ backgroundColor: getRarityColor(nft.rarity) }}
                >
                  {nft.rarity}
                </span>
              </div>
              <div className="nftDetails">
                <h3>{nft.name}</h3>
                <div className="attributes">
                  {nft.attributes.map((attr, index) => (
                    <span key={index} className="attribute">{attr}</span>
                  ))}
                </div>
                <div className="nftFooter">
                  <span className="price">{nft.price}</span>
                  <button 
                    className="buyButton" 
                    onClick={() => buyNFT(nft.id)}
                  >
                    Buy Now
                  </button>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default NFTMarketplace;
"@

    "TokenomicsSection.js" = @"
import React from 'react';
import { PieChart, Pie, Cell, ResponsiveContainer, Legend, Tooltip } from 'recharts';
import './TokenomicsSection.css';

const TokenomicsSection = () => {
  const tokenDistribution = [
    { name: 'Play to Earn', value: 40, color: '#3498db' },
    { name: 'Staking Rewards', value: 20, color: '#2ecc71' },
    { name: 'Team & Development', value: 15, color: '#e74c3c' },
    { name: 'Marketing', value: 10, color: '#f39c12' },
    { name: 'Liquidity', value: 10, color: '#9b59b6' },
    { name: 'Treasury', value: 5, color: '#1abc9c' }
  ];

  const tokenStats = [
    { title: 'Total Supply', value: '1,000,000,000', description: 'Fixed supply' },
    { title: 'Circulating Supply', value: '250,000,000', description: '25% at launch' },
    { title: 'Market Cap', value: '$50M', description: 'Current valuation' },
    { title: 'Holders', value: '10,000+', description: 'Growing community' }
  ];

  return (
    <div className="tokenomics">
      <div className="tokenomicsContainer">
        <h2 className="sectionTitle">$CHIMP Tokenomics</h2>
        <p className="sectionSubtitle">The fuel of the MoonChimp ecosystem</p>
        
        <div className="tokenStats">
          {tokenStats.map((stat, index) => (
            <div key={index} className="statCard">
              <h3>{stat.title}</h3>
              <p className="statValue">{stat.value}</p>
              <p className="statDescription">{stat.description}</p>
            </div>
          ))}
        </div>
        
        <div className="tokenomicsChart">
          <h3>Token Distribution</h3>
          <div className="chartContainer">
            <ResponsiveContainer width="100%" height={400}>
              <PieChart>
                <Pie
                  data={tokenDistribution}
                  cx="50%"
                  cy="50%"
                  labelLine={false}
                  label={({ name, value }) => `{name}: {value}%`}
                  outerRadius={120}
                  fill="#8884d8"
                  dataKey="value"
                >
                  {tokenDistribution.map((entry, index) => (
                    <Cell key={`cell-{index}`} fill={entry.color} />
                  ))}
                </Pie>
                <Tooltip />
                <Legend />
              </PieChart>
            </ResponsiveContainer>
          </div>
        </div>
        
        <div className="distribution">
          <h3>Token Utility</h3>
          <ul className="distributionList">
            <li className="distributionItem">
              <div className="distributionLabel">
                <span className="colorDot" style={{ backgroundColor: '#3498db' }}></span>
                <span>Play to Earn</span>
              </div>
              <span>Earn CHIMP tokens through gameplay achievements</span>
            </li>
            <li className="distributionItem">
              <div className="distributionLabel">
                <span className="colorDot" style={{ backgroundColor: '#2ecc71' }}></span>
                <span>Staking</span>
              </div>
              <span>Stake CHIMP for passive rewards and governance</span>
            </li>
            <li className="distributionItem">
              <div className="distributionLabel">
                <span className="colorDot" style={{ backgroundColor: '#e74c3c' }}></span>
                <span>NFT Trading</span>
              </div>
              <span>Use CHIMP to buy, sell, and upgrade NFTs</span>
            </li>
            <li className="distributionItem">
              <div className="distributionLabel">
                <span className="colorDot" style={{ backgroundColor: '#f39c12' }}></span>
                <span>Governance</span>
              </div>
              <span>Vote on game features and ecosystem decisions</span>
            </li>
          </ul>
        </div>
        
        <button className="launchButton">Buy $CHIMP on Uniswap</button>
      </div>
    </div>
  );
};

export default TokenomicsSection;
"@

    "RoadmapSection.js" = @"
import React from 'react';
import './RoadmapSection.css';

const RoadmapSection = () => {
  const phases = [
    {
      quarter: 'Q1 2025',
      title: 'Launch Phase',
      status: 'completed',
      tasks: [
        { text: 'Token launch on Uniswap', done: true },
        { text: 'NFT collection release', done: true },
        { text: 'Community building', done: true },
        { text: 'Game beta testing', done: true }
      ]
    },
    {
      quarter: 'Q2 2025',
      title: 'Expansion Phase',
      status: 'inProgress',
      tasks: [
        { text: 'Game mainnet launch', done: true },
        { text: 'Mobile app release', done: false },
        { text: 'CEX listings', done: false },
        { text: 'Partnerships announcement', done: false }
      ]
    },
    {
      quarter: 'Q3 2025',
      title: 'Enhancement Phase',
      status: 'upcoming',
      tasks: [
        { text: 'PvP tournaments', done: false },
        { text: 'New game modes', done: false },
        { text: 'Cross-chain integration', done: false },
        { text: 'DAO governance launch', done: false }
      ]
    },
    {
      quarter: 'Q4 2025',
      title: 'Metaverse Phase',
      status: 'upcoming',
      tasks: [
        { text: 'Metaverse integration', done: false },
        { text: 'Land ownership system', done: false },
        { text: 'Advanced AR features', done: false },
        { text: 'Global esports league', done: false }
      ]
    }
  ];

  return (
    <div className="roadmap">
      <div className="roadmapContainer">
        <h2 className="sectionTitle">Mission Roadmap</h2>
        <p className="sectionSubtitle">Our journey to the moon and beyond</p>
        
        <div className="timeline">
          {phases.map((phase, index) => (
            <div key={index} className="phase">
              <div className="phaseContent">
                <h3>{phase.quarter}: {phase.title}</h3>
                <span className={`phaseStatus {phase.status}`}>
                  {phase.status === 'completed' ? 'Completed' : 
                   phase.status === 'inProgress' ? 'In Progress' : 'Upcoming'}
                </span>
                <ul className="taskList">
                  {phase.tasks.map((task, taskIndex) => (
                    <li key={taskIndex} className={task.done ? 'done' : ''}>
                      {task.text}
                    </li>
                  ))}
                </ul>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default RoadmapSection;
"@

    "CommunityHub.js" = @"
import React, { useState, useEffect } from 'react';
import './CommunityHub.css';

const CommunityHub = () => {
  const [leaderboard, setLeaderboard] = useState([]);
  const [events, setEvents] = useState([]);

  useEffect(() => {
    loadLeaderboard();
    loadEvents();
  }, []);

  const loadLeaderboard = () => {
    // Sample leaderboard data
    const sampleLeaderboard = [
      { rank: 1, username: 'SpaceApe42', score: 15420, avatar: '🐵' },
      { rank: 2, username: 'ChimpCommander', score: 14200, avatar: '👨‍🚀' },
      { rank: 3, username: 'MoonWalker', score: 13500, avatar: '🌙' },
      { rank: 4, username: 'StarChimp', score: 12800, avatar: '⭐' },
      { rank: 5, username: 'CosmicBanana', score: 11900, avatar: '🍌' }
    ];
    setLeaderboard(sampleLeaderboard);
  };

  const loadEvents = () => {
    const sampleEvents = [
      {
        id: 1,
        title: 'Weekly Space Race Tournament',
        date: 'Every Sunday 8PM UTC',
        description: 'Compete for 10,000 CHIMP prize pool',
        participants: 245
      },
      {
        id: 2,
        title: 'NFT Minting Event',
        date: 'May 20, 2025',
        description: 'Limited edition Genesis Chimps release',
        participants: 1200
      },
      {
        id: 3,
        title: 'Community AMA',
        date: 'May 25, 2025 3PM UTC',
        description: 'Q&A with the MoonChimp team',
        participants: 500
      }
    ];
    setEvents(sampleEvents);
  };

  const socialLinks = [
    { name: 'Discord', icon: '💬', members: '15K+', link: '#' },
    { name: 'Twitter', icon: '🐦', followers: '25K+', link: '#' },
    { name: 'Telegram', icon: '✈️', members: '10K+', link: '#' },
    { name: 'Reddit', icon: '🤖', members: '8K+', link: '#' }
  ];

  return (
    <div className="community">
      <div className="communityContainer">
        <h2 className="sectionTitle">Community Hub</h2>
        <p className="sectionSubtitle">Join the MoonChimp mission</p>
        
        <div className="socialGrid">
          {socialLinks.map((social, index) => (
            <a key={index} href={social.link} className="socialCard">
              <div className="socialIcon">{social.icon}</div>
              <h3>{social.name}</h3>
              <p>{social.members || social.followers}</p>
            </a>
          ))}
        </div>
        
        <div className="leaderboard">
          <h3>Global Leaderboard</h3>
          <ul className="leaderboardList">
            {leaderboard.map((player) => (
              <li key={player.rank} className="leaderboardItem">
                <span className="leaderboardRank">#{player.rank}</span>
                <span className="leaderboardUser">
                  {player.avatar} {player.username}
                </span>
                <span className="leaderboardScore">{player.score.toLocaleString()}</span>
              </li>
            ))}
          </ul>
        </div>
        
        <div className="events">
          <h3>Upcoming Events</h3>
          {events.map((event) => (
            <div key={event.id} className="eventCard">
              <div className="eventDate">{event.date}</div>
              <h4 className="eventTitle">{event.title}</h4>
              <p className="eventDescription">{event.description}</p>
              <p className="eventParticipants">{event.participants} participants</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
};

export default CommunityHub;
"@

    "MobileARExperience.js" = @"
import React, { useState } from 'react';

const MobileARExperience = () => {
  const [showAR, setShowAR] = useState(false);

  const launchAR = () => {
    // Check if AR is supported
    if ('xr' in navigator && 'isSessionSupported' in navigator.xr) {
      navigator.xr.isSessionSupported('immersive-ar').then((supported) => {
        if (supported) {
          setShowAR(true);
          // Launch AR experience
          console.log('Launching AR experience...');
        } else {
          alert('AR is not supported on this device');
        }
      });
    } else {
      alert('WebXR is not available');
    }
  };

  return (
    <div className="mobile-ar-experience" style={{
      position: 'fixed',
      bottom: '20px',
      right: '20px',
      zIndex: 1000
    }}>
      <button
        onClick={launchAR}
        style={{
          background: 'linear-gradient(45deg, #3498db, #2c3e50)',
          color: 'white',
          border: 'none',
          padding: '15px 30px',
          borderRadius: '50px',
          fontSize: '16px',
          cursor: 'pointer',
          boxShadow: '0 4px 15px rgba(0, 0, 0, 0.3)',
          display: 'flex',
          alignItems: 'center',
          gap: '10px'
        }}
      >
        <span>📱</span>
        <span>Launch AR Mode</span>
      </button>
      
      {showAR && (
        <div style={{
          position: 'fixed',
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          background: 'black',
          zIndex: 9999
        }}>
          {/* AR View Component */}
          <button
            onClick={() => setShowAR(false)}
            style={{
              position: 'absolute',
              top: '20px',
              right: '20px',
              background: 'rgba(255, 255, 255, 0.2)',
              color: 'white',
              border: 'none',
              padding: '10px 20px',
              borderRadius: '25px',
              cursor: 'pointer'
            }}
          >
            Close AR
          </button>
        </div>
      )}
    </div>
  );
};

export default MobileARExperience;
"@
}

# Create all components
foreach ($componentName in $components.Keys) {
    Write-Host "Creating $componentName..." -ForegroundColor Yellow
    $components[$componentName] | Out-File -FilePath "$projectRoot\src\components\$componentName" -Encoding UTF8
}

# Step 4: Create all CSS files
Write-Host "`nStep 4: Creating CSS files..." -ForegroundColor Green

# Create App.css
@"
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Space Grotesk', sans-serif;
  background-color: #0a0e1a;
  color: #ffffff;
  overflow-x: hidden;
}

.App {
  min-height: 100vh;
  background: linear-gradient(180deg, #0a0e1a 0%, #1a1f2e 100%);
}

/* Navbar Styles */
.navbar {
  position: fixed;
  top: 0;
  width: 100%;
  background: rgba(10, 14, 26, 0.95);
  backdrop-filter: blur(10px);
  z-index: 1000;
  padding: 1rem 0;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.navContainer {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo h1 {
  font-family: 'Orbitron', sans-serif;
  font-size: 1.8rem;
  background: linear-gradient(45deg, #3498db, #2ecc71);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.navLinks {
  display: flex;
  gap: 2rem;
  align-items: center;
}

.navLinks a {
  color: #ffffff;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
}

.navLinks a:hover {
  color: #3498db;
}

.connectWallet {
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  border: none;
  padding: 0.7rem 2rem;
  border-radius: 25px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.3s ease;
}

.connectWallet:hover {
  transform: translateY(-2px);
}

/* Section Styles */
section {
  padding: 5rem 0;
  position: relative;
}

.sectionTitle {
  font-family: 'Orbitron', sans-serif;
  font-size: 3rem;
  margin-bottom: 1rem;
  text-align: center;
  background: linear-gradient(45deg, #3498db, #2ecc71);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.sectionSubtitle {
  text-align: center;
  color: #8892b0;
  font-size: 1.2rem;
  margin-bottom: 3rem;
}

/* Footer Styles */
.footer {
  background: #0a0e1a;
  padding: 3rem 0 1rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.footerContainer {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
}

.footerContent {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin-bottom: 2rem;
}

.footerSection h3,
.footerSection h4 {
  margin-bottom: 1rem;
  color: #3498db;
}

.footerSection a {
  display: block;
  color: #8892b0;
  text-decoration: none;
  margin: 0.5rem 0;
  transition: color 0.3s ease;
}

.footerSection a:hover {
  color: #ffffff;
}

.footerBottom {
  text-align: center;
  padding-top: 2rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  color: #8892b0;
}

/* Responsive Design */
@media (max-width: 768px) {
  .navLinks {
    display: none;
  }
  
  .sectionTitle {
    font-size: 2rem;
  }
  
  .sectionSubtitle {
    font-size: 1rem;
  }
}
"@ | Out-File -FilePath "$projectRoot\src\App.css" -Encoding UTF8

# Create all component CSS files
$cssFiles = @{
    "HeroSection.css" = @"
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  padding: 2rem;
  position: relative;
  overflow: hidden;
  background: radial-gradient(ellipse at center, #1a1f2e 0%, #0a0e1a 100%);
}

.hero::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: url('/images/stars.png') repeat;
  animation: starsMove 100s linear infinite;
  opacity: 0.3;
}

@keyframes starsMove {
  from { transform: translateY(0); }
  to { transform: translateY(-100%); }
}

.heroContent {
  max-width: 600px;
  z-index: 2;
  position: relative;
}

.heroTitle {
  font-family: 'Orbitron', sans-serif;
  font-size: 4rem;
  font-weight: 900;
  margin-bottom: 1rem;
  background: linear-gradient(45deg, #3498db, #2ecc71, #3498db);
  background-size: 200% 200%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradientShift 3s ease infinite;
}

@keyframes gradientShift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.heroSubtitle {
  font-size: 2rem;
  margin-bottom: 1rem;
  color: #2ecc71;
}

.heroDescription {
  font-size: 1.2rem;
  line-height: 1.8;
  color: #8892b0;
  margin-bottom: 2rem;
}

.heroButtons {
  display: flex;
  gap: 1rem;
  margin-bottom: 3rem;
}

.playNowButton,
.learnMoreButton {
  padding: 1rem 2.5rem;
  border: none;
  border-radius: 50px;
  font-size: 1.1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.playNowButton {
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
}

.playNowButton:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(52, 152, 219, 0.6);
}

.learnMoreButton {
  background: transparent;
  color: white;
  border: 2px solid #3498db;
}

.learnMoreButton:hover {
  background: #3498db;
}

.heroStats {
  display: flex;
  gap: 3rem;
}

.stat {
  text-align: center;
}

.statValue {
  font-size: 2.5rem;
  font-weight: 700;
  color: #3498db;
  display: block;
}

.statLabel {
  color: #8892b0;
  font-size: 1rem;
}

.heroImage {
  position: absolute;
  right: -200px;
  top: 50%;
  transform: translateY(-50%);
  width: 600px;
  height: 600px;
  opacity: 0.3;
  z-index: 1;
}

@media (max-width: 768px) {
  .hero {
    padding: 6rem 1rem 2rem;
  }
  
  .heroTitle {
    font-size: 2.5rem;
  }
  
  .heroSubtitle {
    font-size: 1.5rem;
  }
  
  .heroButtons {
    flex-direction: column;
  }
  
  .heroStats {
    flex-direction: column;
    gap: 1rem;
  }
  
  .heroImage {
    display: none;
  }
}
"@

    "FeaturesSection.css" = @"
.features {
  padding: 4rem 2rem;
  background: #1a1f2e;
}

.featuresContainer {
  max-width: 1200px;
  margin: 0 auto;
}

.featuresGrid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
}

.featureCard {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  text-align: center;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.featureCard:hover {
  transform: translateY(-5px);
  border-color: #3498db;
  box-shadow: 0 10px 30px rgba(52, 152, 219, 0.3);
}

.featureIcon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.featureCard h3 {
  font-size: 1.4rem;
  margin-bottom: 1rem;
  color: #3498db;
}

.featureCard p {
  color: #8892b0;
  line-height: 1.6;
}

@media (max-width: 768px) {
  .featuresGrid {
    grid-template-columns: 1fr;
  }
}
"@

    "AboutSection.css" = @"
.about {
  padding: 4rem 2rem;
  background: #0f1520;
}

.aboutContainer {
  max-width: 1200px;
  margin: 0 auto;
}

.aboutContent {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}

.aboutText {
  padding: 2rem;
}

.aboutParagraph {
  font-size: 1.1rem;
  line-height: 1.8;
  color: #8892b0;
  margin-bottom: 1.5rem;
}

.aboutStats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  margin-top: 3rem;
}

.aboutStat {
  text-align: center;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 10px;
  transition: all 0.3s ease;
}

.aboutStat:hover {
  transform: scale(1.05);
  background: rgba(255, 255, 255, 0.1);
}

.aboutStat h3 {
  font-size: 2rem;
  color: #3498db;
  margin-bottom: 0.5rem;
}

.aboutStat p {
  color: #8892b0;
}

.aboutImage {
  position: relative;
  height: 500px;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 15px;
  overflow: hidden;
}

@media (max-width: 768px) {
  .aboutContent {
    grid-template-columns: 1fr;
  }
  
  .aboutStats {
    grid-template-columns: 1fr;
  }
  
  .aboutImage {
    height: 300px;
  }
}
"@

    "GameIntegration.css" = @"
.gameIntegration {
  width: 100%;
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

.playButton {
  background: linear-gradient(45deg, #2c3e50, #3498db);
  color: white;
  border: none;
  padding: 1rem 3rem;
  font-size: 1.2rem;
  border-radius: 50px;
  cursor: pointer;
  display: block;
  margin: 2rem auto;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.playButton:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}

.gameContainer {
  width: 100%;
  height: 600px;
  background: #1a1f2e;
  border-radius: 10px;
  overflow: hidden;
  position: relative;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
}

.gameCanvas {
  width: 100%;
  height: 100%;
}

.loadingBar {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 60%;
}

.loadingBar .progress {
  background: #3498db;
  height: 4px;
  border-radius: 2px;
  transition: width 0.3s ease;
}

.loadingText {
  color: white;
  text-align: center;
  margin-top: 20px;
  font-size: 1.1rem;
}

.fullscreenButton {
  position: absolute;
  bottom: 20px;
  right: 20px;
  background: rgba(0, 0, 0, 0.5);
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.fullscreenButton:hover {
  background: rgba(0, 0, 0, 0.7);
}

.controlsInfo {
  background: rgba(255, 255, 255, 0.1);
  padding: 1rem;
  border-radius: 10px;
  margin-top: 2rem;
  text-align: center;
  color: white;
}

.controlsInfo p {
  margin: 0.5rem 0;
}
"@

    "NFTMarketplace.css" = @"
.nftMarketplace {
  padding: 4rem 2rem;
  background: #1a1f2e;
}

.marketplaceContainer {
  max-width: 1200px;
  margin: 0 auto;
}

.filterButtons {
  display: flex;
  justify-content: center;
  gap: 1rem;
  margin: 2rem 0;
}

.filterButtons button {
  padding: 0.7rem 1.5rem;
  border: 2px solid #3498db;
  background: transparent;
  color: #3498db;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.filterButtons button:hover,
.filterButtons button.active {
  background: #3498db;
  color: white;
}

.nftGrid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
}

.nftCard {
  background: rgba(255, 255, 255, 0.05);
  border-radius: 15px;
  overflow: hidden;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.nftCard:hover {
  transform: translateY(-5px);
  box-shadow: 0 15px 30px rgba(0, 0, 0, 0.5);
}

.nftImage {
  position: relative;
  height: 280px;
  background: #0f1520;
  overflow: hidden;
}

.nftImage img {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.rarityBadge {
  position: absolute;
  top: 10px;
  right: 10px;
  padding: 0.3rem 1rem;
  border-radius: 20px;
  font-size: 0.8rem;
  font-weight: 600;
  color: white;
}

.nftDetails {
  padding: 1.5rem;
}

.nftDetails h3 {
  font-size: 1.2rem;
  margin-bottom: 1rem;
  color: white;
}

.attributes {
  display: flex;
  flex-wrap: wrap;
  gap: 0.5rem;
  margin-bottom: 1rem;
}

.attribute {
  background: rgba(52, 152, 219, 0.2);
  padding: 0.3rem 0.8rem;
  border-radius: 15px;
  font-size: 0.8rem;
  color: #3498db;
}

.nftFooter {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-top: 1rem;
  padding-top: 1rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.price {
  font-size: 1.2rem;
  font-weight: 600;
  color: #3498db;
}

.buyButton {
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  border: none;
  padding: 0.5rem 1.5rem;
  border-radius: 20px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.buyButton:hover {
  transform: scale(1.05);
}

@media (max-width: 768px) {
  .nftGrid {
    grid-template-columns: 1fr;
  }
}
"@

    "TokenomicsSection.css" = @"
.tokenomics {
  padding: 4rem 2rem;
  background: linear-gradient(180deg, #1e2833 0%, #0f1520 100%);
  text-align: center;
}

.tokenomicsContainer {
  max-width: 1200px;
  margin: 0 auto;
}

.tokenStats {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
}

.statCard {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: all 0.3s ease;
}

.statCard:hover {
  transform: translateY(-5px);
  border-color: #3498db;
  box-shadow: 0 10px 30px rgba(52, 152, 219, 0.3);
}

.statCard h3 {
  color: #3498db;
  font-size: 1.2rem;
  margin-bottom: 1rem;
}

.statValue {
  font-size: 2rem;
  font-weight: bold;
  color: white;
  margin-bottom: 0.5rem;
}

.statDescription {
  color: #8892b0;
  font-size: 0.9rem;
}

.tokenomicsChart {
  background: rgba(255, 255, 255, 0.05);
  padding: 3rem;
  border-radius: 15px;
  margin: 3rem 0;
}

.chartContainer {
  max-width: 500px;
  margin: 0 auto;
}

.distribution {
  margin-top: 3rem;
}

.distributionList {
  list-style: none;
  padding: 0;
  max-width: 600px;
  margin: 2rem auto;
}

.distributionItem {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  margin: 0.5rem 0;
  border-radius: 10px;
  transition: all 0.3s ease;
}

.distributionItem:hover {
  background: rgba(255, 255, 255, 0.1);
}

.distributionLabel {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.colorDot {
  width: 12px;
  height: 12px;
  border-radius: 50%;
}

.launchButton {
  background: linear-gradient(45deg, #e74c3c, #c0392b);
  color: white;
  border: none;
  padding: 1rem 3rem;
  font-size: 1.2rem;
  border-radius: 50px;
  cursor: pointer;
  margin: 2rem auto;
  display: block;
  transition: all 0.3s ease;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.launchButton:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
}
"@

    "RoadmapSection.css" = @"
.roadmap {
  padding: 4rem 2rem;
  background: #0f1520;
  text-align: center;
}

.roadmapContainer {
  max-width: 1000px;
  margin: 0 auto;
}

.timeline {
  position: relative;
  padding: 2rem 0;
  margin: 3rem 0;
}

.timeline::after {
  content: '';
  position: absolute;
  width: 6px;
  background: #3498db;
  top: 0;
  bottom: 0;
  left: 50%;
  margin-left: -3px;
}

.phase {
  position: relative;
  width: 50%;
  padding: 10px 40px;
}

.phase::after {
  content: '';
  position: absolute;
  width: 25px;
  height: 25px;
  right: -17px;
  background: #3498db;
  border: 4px solid #0f1520;
  top: 15px;
  border-radius: 50%;
  z-index: 1;
}

.phase:nth-child(even) {
  left: 50%;
}

.phase:nth-child(even)::after {
  left: -16px;
}

.phaseContent {
  padding: 20px 30px;
  background: rgba(255, 255, 255, 0.05);
  position: relative;
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: all 0.3s ease;
}

.phase:hover .phaseContent {
  transform: scale(1.05);
  border-color: #3498db;
  box-shadow: 0 10px 30px rgba(52, 152, 219, 0.3);
}

.phaseContent h3 {
  color: #3498db;
  font-size: 1.4rem;
  margin-bottom: 1rem;
}

.phaseStatus {
  display: inline-block;
  padding: 0.3rem 1rem;
  border-radius: 20px;
  font-size: 0.9rem;
  margin-bottom: 1rem;
}

.completed {
  background: #27ae60;
  color: white;
}

.inProgress {
  background: #f39c12;
  color: white;
}

.upcoming {
  background: #3498db;
  color: white;
}

.taskList {
  list-style: none;
  padding: 0;
  text-align: left;
}

.taskList li {
  padding: 0.5rem 0;
  color: #8892b0;
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.taskList li.done {
  color: #27ae60;
}

.taskList li.done::before {
  content: '✓';
  color: #27ae60;
  font-weight: bold;
}

.taskList li:not(.done)::before {
  content: '○';
  color: #3498db;
}

@media screen and (max-width: 768px) {
  .timeline::after {
    left: 31px;
  }
  
  .phase {
    width: 100%;
    padding-left: 70px;
    padding-right: 25px;
  }
  
  .phase::after {
    left: 15px;
  }
  
  .phase:nth-child(even) {
    left: 0%;
  }
}
"@

    "CommunityHub.css" = @"
.community {
  padding: 4rem 2rem;
  background: linear-gradient(180deg, #0f1520 0%, #1e2833 100%);
  text-align: center;
}

.communityContainer {
  max-width: 1200px;
  margin: 0 auto;
}

.socialGrid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 2rem;
  margin: 3rem 0;
}

.socialCard {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.1);
  transition: all 0.3s ease;
  cursor: pointer;
  text-decoration: none;
}

.socialCard:hover {
  transform: translateY(-5px);
  border-color: #3498db;
  box-shadow: 0 10px 30px rgba(52, 152, 219, 0.3);
}

.socialIcon {
  font-size: 3rem;
  margin-bottom: 1rem;
}

.socialCard h3 {
  color: white;
  font-size: 1.2rem;
  margin-bottom: 0.5rem;
}

.socialCard p {
  color: #8892b0;
  font-size: 0.9rem;
}

.leaderboard {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  margin: 3rem 0;
  max-width: 800px;
  margin-left: auto;
  margin-right: auto;
}

.leaderboard h3 {
  color: #3498db;
  font-size: 1.4rem;
  margin-bottom: 2rem;
}

.leaderboardList {
  list-style: none;
  padding: 0;
}

.leaderboardItem {
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 1rem;
  background: rgba(255, 255, 255, 0.05);
  margin: 0.5rem 0;
  border-radius: 10px;
  transition: all 0.3s ease;
}

.leaderboardItem:hover {
  background: rgba(255, 255, 255, 0.1);
}

.leaderboardRank {
  font-weight: bold;
  color: #3498db;
  margin-right: 1rem;
}

.leaderboardUser {
  flex: 1;
  text-align: left;
  color: white;
}

.leaderboardScore {
  color: #f39c12;
  font-weight: bold;
}

.events {
  margin: 3rem 0;
}

.eventCard {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  margin: 1rem 0;
  border: 1px solid rgba(255, 255, 255, 0.1);
  max-width: 600px;
  margin-left: auto;
  margin-right: auto;
  transition: all 0.3s ease;
}

.eventCard:hover {
  transform: scale(1.02);
  border-color: #3498db;
}

.eventDate {
  color: #3498db;
  font-size: 0.9rem;
  margin-bottom: 0.5rem;
}

.eventTitle {
  color: white;
  font-size: 1.3rem;
  margin-bottom: 1rem;
}

.eventDescription {
  color: #8892b0;
  line-height: 1.6;
}

.eventParticipants {
  color: #8892b0;
  font-size: 0.9rem;
  margin-top: 1rem;
}
"@
}

# Create all CSS files
foreach ($cssFileName in $cssFiles.Keys) {
    Write-Host "Creating $cssFileName..." -ForegroundColor Yellow
    $cssFiles[$cssFileName] | Out-File -FilePath "$projectRoot\src\components\$cssFileName" -Encoding UTF8
}

# Step 5: Create additional configuration files
Write-Host "`nStep 5: Creating configuration files..." -ForegroundColor Green

# index.js
@"
import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import App from './App';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
"@ | Out-File -FilePath "$projectRoot\src\index.js" -Encoding UTF8

# index.css
@"
body {
  margin: 0;
  font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', 'Roboto', 'Oxygen',
    'Ubuntu', 'Cantarell', 'Fira Sans', 'Droid Sans', 'Helvetica Neue',
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, 'Courier New',
    monospace;
}
"@ | Out-File -FilePath "$projectRoot\src\index.css" -Encoding UTF8

# package.json modifications (updating scripts)
Write-Host "Updating package.json scripts..." -ForegroundColor Yellow
$packageJson = Get-Content "$projectRoot\package.json" | ConvertFrom-Json
$packageJson.scripts = @{
    "start" = "react-scripts start"
    "build" = "react-scripts build"
    "test" = "react-scripts test"
    "eject" = "react-scripts eject"
}
$packageJson | ConvertTo-Json -Depth 10 | Out-File -FilePath "$projectRoot\package.json" -Encoding UTF8

# Create the rest of the files...
Write-Host "`nStep 6: Creating utility files and final configs..." -ForegroundColor Green

# api.js
@"
const API_BASE_URL = process.env.REACT_APP_API_URL || 'http://localhost:3001';

export const api = {
  // Authentication
  auth: {
    login: async (credentials) => {
      const response = await fetch(`\${API_BASE_URL}/auth/login`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(credentials)
      });
      return response.json();
    },
    register: async (userData) => {
      const response = await fetch(`\${API_BASE_URL}/auth/register`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(userData)
      });
      return response.json();
    },
    logout: async () => {
      const response = await fetch(`\${API_BASE_URL}/auth/logout`, {
        method: 'POST',
        credentials: 'include'
      });
      return response.json();
    }
  },

  // NFT Operations
  nft: {
    getAll: async () => {
      const response = await fetch(`${API_BASE_URL}/nfts`);
      return response.json();
    },
    getById: async (id) => {
      const response = await fetch(`${API_BASE_URL}/nfts/${id}`);
      return response.json();
    },
    mint: async (nftData) => {
      const response = await fetch(`${API_BASE_URL}/nfts/mint`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(nftData)
      });
      return response.json();
    },
    trade: async (tradeData) => {
      const response = await fetch(`${API_BASE_URL}/nfts/trade`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(tradeData)
      });
      return response.json();
    }
  },

  // Game Data
  game: {
    getLeaderboard: async () => {
      const response = await fetch(`${API_BASE_URL}/game/leaderboard`);
      return response.json();
    },
    submitScore: async (scoreData) => {
      const response = await fetch(`${API_BASE_URL}/game/score`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(scoreData)
      });
      return response.json();
    },
    getStats: async (userId) => {
      const response = await fetch(`${API_BASE_URL}/game/stats/${userId}`);
      return response.json();
    }
  },

  // User Data
  user: {
    getProfile: async (userId) => {
      const response = await fetch(`${API_BASE_URL}/users/${userId}`);
      return response.json();
    },
    updateProfile: async (userId, profileData) => {
      const response = await fetch(`${API_BASE_URL}/users/${userId}`, {
        method: 'PUT',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(profileData)
      });
      return response.json();
    }
  }
};
"@ | Out-File -FilePath "$projectRoot\src\utils\api.js" -Encoding UTF8

# public/index.html
@"
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="MoonChimp.io - The Ultimate Space Adventure Game"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>MoonChimp.io - Space Adventure Awaits</title>
    
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Space+Grotesk:wght@300;400;500;700&display=swap" rel="stylesheet">
  </head>
  <body>
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
"@ | Out-File -FilePath "$projectRoot\public\index.html" -Encoding UTF8

# public/manifest.json
@"
{
  "short_name": "MoonChimp",
  "name": "MoonChimp.io - Space Adventure Game",
  "icons": [
    {
      "src": "favicon.ico",
      "sizes": "64x64 32x32 24x24 16x16",
      "type": "image/x-icon"
    },
    {
      "src": "logo192.png",
      "type": "image/png",
      "sizes": "192x192"
    },
    {
      "src": "logo512.png",
      "type": "image/png",
      "sizes": "512x512"
    }
  ],
  "start_url": ".",
  "display": "standalone",
  "theme_color": "#000000",
  "background_color": "#0f1520"
}
"@ | Out-File -FilePath "$projectRoot\public\manifest.json" -Encoding UTF8

# .gitignore
@"
# dependencies
/node_modules
/.pnp
.pnp.js

# testing
/coverage

# production
/build

# misc
.DS_Store
.env.local
.env.development.local
.env.test.local
.env.production.local

npm-debug.log*
yarn-debug.log*
yarn-error.log*

# Unity WebGL Build Files
/public/build/
*.wasm
*.data
*.framework.js

# IDEs
.vscode/
.idea/
*.swp
*.swo

# OS
Thumbs.db
"@ | Out-File -FilePath "$projectRoot\.gitignore" -Encoding UTF8

# .env.example
@"
REACT_APP_API_URL=http://localhost:3001
REACT_APP_WEB3_PROVIDER=https://mainnet.infura.io/v3/YOUR_PROJECT_ID
REACT_APP_CONTRACT_ADDRESS=0x0000000000000000000000000000000000000000
REACT_APP_CHAIN_ID=1
REACT_APP_GOOGLE_ANALYTICS_ID=UA-000000-0
"@ | Out-File -FilePath "$projectRoot\.env.example" -Encoding UTF8

# README.md
@"
# MoonChimp.io

Welcome to MoonChimp.io - The Ultimate Space Adventure Game!

## Overview

MoonChimp.io is a next-generation web3 gaming platform featuring:
- Epic space battles with elite M.C. Corp chimps
- NFT marketplace for unique characters
- $CHIMP tokenomics
- Community-driven gameplay
- AR mobile experience

## Prerequisites

Before you begin, ensure you have the following installed:
- Node.js (v14 or higher)
- npm (v6 or higher)
- Git

## Installation

1. Clone the repository:
   ```bash
   git clone [repository-url]
   cd moonchimp-io
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Create a `.env` file based on `.env.example`:
   ```bash
   cp .env.example .env
   ```

4. Update the `.env` file with your configuration values.

## Unity WebGL Integration

To integrate your Unity game:

1. Build your Unity project for WebGL
2. Copy the build files to `public/build/`:
   - `MoonChimp.data`
   - `MoonChimp.framework.js`
   - `MoonChimp.wasm`
   - `MoonChimp.loader.js` (if present)

## Development

Start the development server:

```bash
npm start
```

Open [http://localhost:3000](http://localhost:3000) to view it in the browser.

## Production Build

Create a production build:

```bash
npm run build
```

The build folder is ready to be deployed.

## Deployment

### Vercel

```bash
npm install -g vercel
vercel
```

### Netlify

1. Build the project: `npm run build`
2. Deploy the `build` folder to Netlify

### Traditional Hosting

Upload the contents of the `build` folder to your web server.

## Project Structure

```
moonchimp-io/
├── public/
│   ├── index.html
│   ├── manifest.json
│   └── build/           # Unity WebGL files
├── src/
│   ├── components/      # React components
│   ├── utils/          # Utility functions
│   ├── App.js          # Main app component
│   ├── App.css         # Main styles
│   └── index.js        # Entry point
├── .env.example        # Environment variables template
├── .gitignore
├── package.json
└── README.md
```

## Features

- **Game Integration**: Full Unity WebGL integration
- **NFT Marketplace**: Buy, sell, and trade unique chimps
- **Tokenomics**: $CHIMP token with staking rewards
- **Community Hub**: Leaderboards, events, and social features
- **AR Experience**: Mobile AR features (iOS/Android)

## Technologies Used

- React.js
- Web3.js
- Unity WebGL
- Node.js
- Express.js (backend)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

- Discord: [Join our server](https://discord.gg/moonchimp)
- Twitter: [@MoonChimpIO](https://twitter.com/MoonChimpIO)
- Email: support@moonchimp.io

## Acknowledgments

- Thanks to all our community members
- Special thanks to our early supporters
- Unity Technologies for the game engine
- The React team for the amazing framework
"@ | Out-File -FilePath "$projectRoot\README.md" -Encoding UTF8

# Create a setup completion summary
Write-Host "`n✅ MoonChimp.io Setup Complete!" -ForegroundColor Green
Write-Host "================================" -ForegroundColor Green
Write-Host "`nProject created at: $projectRoot" -ForegroundColor Cyan

Write-Host "`n📋 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Navigate to project directory:"
Write-Host "   cd $projectRoot" -ForegroundColor Cyan
Write-Host "`n2. Your project structure is ready with:"
Write-Host "   - All React components ✓" -ForegroundColor Green
Write-Host "   - All CSS styling files ✓" -ForegroundColor Green
Write-Host "   - Configuration files ✓" -ForegroundColor Green
Write-Host "   - Utility functions ✓" -ForegroundColor Green
Write-Host "`n3. Complete the setup:"
Write-Host "   - Copy .env.example to .env and configure" -ForegroundColor Yellow
Write-Host "   - Add Unity WebGL build files to public/build/" -ForegroundColor Yellow
Write-Host "   - Add logo and favicon files" -ForegroundColor Yellow
Write-Host "`n4. Start development server:"
Write-Host "   npm start" -ForegroundColor Cyan
Write-Host "`n5. Build for production:"
Write-Host "   npm run build" -ForegroundColor Cyan

Write-Host "`n🚀 Your MoonChimp.io website is ready for launch! 🐵" -ForegroundColor Green
Write-Host "`nHappy coding! 💻✨" -ForegroundColor Magenta
