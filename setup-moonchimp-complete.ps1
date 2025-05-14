# Create Complete MoonChimp.io Website Components

# First, let's create all the component files

# 1. HeroSection.js
@'
import React from 'react';
import './HeroSection.css';

const HeroSection = () => {
  return (
    <div className="hero">
      <div className="hero-bg">
        <div className="stars"></div>
        <div className="cosmic-dust"></div>
      </div>
      <div className="hero-content">
        <h1 className="hero-title">Welcome to MoonChimp.io</h1>
        <h2 className="hero-subtitle">Join the Elite Space Chimps</h2>
        <p className="hero-description">
          Enter a universe where elite M.C. Corp chimps in Halo Spartan suits
          embark on epic space missions. Collect unique NFTs, earn $CHIMP tokens,
          and conquer the cosmos!
        </p>
        <div className="hero-buttons">
          <button className="btn-primary">Play Now</button>
          <button className="btn-secondary">Learn More</button>
        </div>
        <div className="hero-stats">
          <div className="stat">
            <span className="stat-value">50K+</span>
            <span className="stat-label">Active Players</span>
          </div>
          <div className="stat">
            <span className="stat-value">10K+</span>
            <span className="stat-label">NFTs Minted</span>
          </div>
          <div className="stat">
            <span className="stat-value">$2M+</span>
            <span className="stat-label">Total Volume</span>
          </div>
        </div>
      </div>
      <div className="hero-image">
        <img src="/images/hero-chimp.png" alt="MoonChimp Hero" />
      </div>
    </div>
  );
};

export default HeroSection;
'@ | Out-File -FilePath "src/components/HeroSection.js" -Encoding UTF8

# 2. HeroSection.css
@'
.hero {
  min-height: 100vh;
  display: flex;
  align-items: center;
  position: relative;
  overflow: hidden;
  background: radial-gradient(ellipse at center, #1a1f2e 0%, #0a0e1a 100%);
}

.hero-bg {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  z-index: 0;
}

.stars {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-image: 
    radial-gradient(2px 2px at 20px 30px, #fff, transparent),
    radial-gradient(2px 2px at 40px 70px, #fff, transparent),
    radial-gradient(1px 1px at 50px 50px, #fff, transparent),
    radial-gradient(1px 1px at 80px 10px, #fff, transparent),
    radial-gradient(2px 2px at 130px 80px, #fff, transparent);
  background-repeat: repeat;
  background-size: 200px 200px;
  animation: stars-animation 200s linear infinite;
}

@keyframes stars-animation {
  from { transform: translateY(0); }
  to { transform: translateY(-200px); }
}

.cosmic-dust {
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: radial-gradient(ellipse at center, rgba(52, 152, 219, 0.1) 0%, transparent 70%);
  animation: pulse 4s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 0.5; }
  50% { opacity: 0.8; }
}

.hero-content {
  max-width: 600px;
  z-index: 2;
  position: relative;
  padding: 0 2rem;
}

.hero-title {
  font-family: 'Orbitron', sans-serif;
  font-size: 4rem;
  font-weight: 900;
  margin-bottom: 1rem;
  background: linear-gradient(45deg, #3498db, #2ecc71, #3498db);
  background-size: 200% 200%;
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  animation: gradient-shift 3s ease infinite;
}

@keyframes gradient-shift {
  0% { background-position: 0% 50%; }
  50% { background-position: 100% 50%; }
  100% { background-position: 0% 50%; }
}

.hero-subtitle {
  font-size: 2rem;
  margin-bottom: 1rem;
  color: #2ecc71;
}

.hero-description {
  font-size: 1.2rem;
  line-height: 1.8;
  color: #8892b0;
  margin-bottom: 2rem;
}

.hero-buttons {
  display: flex;
  gap: 1rem;
  margin-bottom: 3rem;
}

.btn-primary, .btn-secondary {
  padding: 1rem 2.5rem;
  border: none;
  border-radius: 50px;
  font-size: 1.1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
}

.btn-primary {
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  box-shadow: 0 4px 15px rgba(52, 152, 219, 0.4);
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(52, 152, 219, 0.6);
}

.btn-secondary {
  background: transparent;
  color: white;
  border: 2px solid #3498db;
}

.btn-secondary:hover {
  background: #3498db;
}

.hero-stats {
  display: flex;
  gap: 3rem;
}

.stat {
  text-align: center;
}

.stat-value {
  font-size: 2.5rem;
  font-weight: 700;
  color: #3498db;
  display: block;
}

.stat-label {
  color: #8892b0;
  font-size: 1rem;
}

.hero-image {
  position: absolute;
  right: -100px;
  top: 50%;
  transform: translateY(-50%);
  width: 600px;
  height: 600px;
  z-index: 1;
}

.hero-image img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  filter: drop-shadow(0 0 30px rgba(52, 152, 219, 0.5));
}

@media (max-width: 768px) {
  .hero-title {
    font-size: 2.5rem;
  }
  
  .hero-subtitle {
    font-size: 1.5rem;
  }
  
  .hero-buttons {
    flex-direction: column;
  }
  
  .hero-stats {
    flex-direction: column;
    gap: 1rem;
  }
  
  .hero-image {
    display: none;
  }
}
'@ | Out-File -FilePath "src/components/HeroSection.css" -Encoding UTF8

# 3. FeaturesSection.js
@'
import React from 'react';
import './FeaturesSection.css';

const FeaturesSection = () => {
  const features = [
    {
      icon: '🚀',
      title: 'Space Exploration',
      description: 'Navigate through stunning cosmic environments and discover new worlds',
      color: '#3498db'
    },
    {
      icon: '🎮',
      title: 'Battle Royale',
      description: 'Compete in intense multiplayer battles with your customized chimps',
      color: '#e74c3c'
    },
    {
      icon: '💎',
      title: 'NFT Collectibles',
      description: 'Collect, trade, and upgrade unique chimp NFTs with special abilities',
      color: '#9b59b6'
    },
    {
      icon: '💰',
      title: 'Play to Earn',
      description: 'Earn CHIMP tokens through gameplay and stake for passive rewards',
      color: '#f39c12'
    },
    {
      icon: '🛠️',
      title: 'Customization',
      description: 'Upgrade your chimp with unique suits, weapons, and equipment',
      color: '#1abc9c'
    },
    {
      icon: '🌐',
      title: 'Cross-Platform',
      description: 'Play on web, mobile, and experience AR features on the go',
      color: '#2ecc71'
    }
  ];

  return (
    <div className="features">
      <div className="container">
        <h2 className="section-title">Game Features</h2>
        <p className="section-subtitle">Experience the future of gaming in the MoonChimp universe</p>
        <div className="features-grid">
          {features.map((feature, index) => (
            <div key={index} className="feature-card">
              <div className="feature-icon" style={{ background: feature.color }}>
                {feature.icon}
              </div>
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
'@ | Out-File -FilePath "src/components/FeaturesSection.js" -Encoding UTF8

# 4. FeaturesSection.css
@'
.features {
  padding: 5rem 2rem;
  background: #1a1f2e;
  position: relative;
  overflow: hidden;
}

.features::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  right: 0;
  height: 1px;
  background: linear-gradient(90deg, transparent, #3498db, transparent);
}

.container {
  max-width: 1200px;
  margin: 0 auto;
}

.section-title {
  font-family: 'Orbitron', sans-serif;
  font-size: 3rem;
  margin-bottom: 1rem;
  text-align: center;
  background: linear-gradient(45deg, #3498db, #2ecc71);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.section-subtitle {
  text-align: center;
  color: #8892b0;
  font-size: 1.2rem;
  margin-bottom: 4rem;
}

.features-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 2rem;
}

.feature-card {
  background: rgba(255, 255, 255, 0.05);
  padding: 2.5rem;
  border-radius: 20px;
  text-align: center;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
  backdrop-filter: blur(10px);
}

.feature-card:hover {
  transform: translateY(-5px);
  border-color: #3498db;
  box-shadow: 0 20px 40px rgba(52, 152, 219, 0.3);
}

.feature-icon {
  width: 80px;
  height: 80px;
  margin: 0 auto 1.5rem;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 2.5rem;
  border-radius: 20px;
  transition: all 0.3s ease;
}

.feature-card:hover .feature-icon {
  transform: scale(1.1);
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
}

.feature-card h3 {
  font-size: 1.5rem;
  margin-bottom: 1rem;
  color: white;
}

.feature-card p {
  color: #8892b0;
  line-height: 1.7;
  font-size: 1.1rem;
}

@media (max-width: 768px) {
  .features-grid {
    grid-template-columns: 1fr;
  }
  
  .section-title {
    font-size: 2rem;
  }
}
'@ | Out-File -FilePath "src/components/FeaturesSection.css" -Encoding UTF8

# 5. AboutSection.js
@'
import React from 'react';
import './AboutSection.css';

const AboutSection = () => {
  return (
    <div className="about">
      <div className="container">
        <div className="about-content">
          <div className="about-text">
            <h2 className="section-title">The MoonChimp Story</h2>
            <p className="about-paragraph">
              In the year 2142, humanity discovered an ancient alien artifact on the moon.
              This artifact transformed Earth's primates into highly intelligent beings,
              creating the elite M.C. Corp - Moon Chimp Corporation.
            </p>
            <p className="about-paragraph">
              These enhanced chimps, equipped with advanced Halo Spartan-style suits,
              now serve as humanity's greatest explorers and defenders in the vast cosmos.
              Each chimp possesses unique abilities and characteristics, making them
              valuable assets in the fight for cosmic dominance.
            </p>
            <p className="about-paragraph">
              Join the M.C. Corp today and lead your chimp squad to victory across
              the galaxy. The universe awaits your command!
            </p>
            <div className="about-stats">
              <div className="about-stat">
                <h3>100+</h3>
                <p>Unique Chimp Types</p>
              </div>
              <div className="about-stat">
                <h3>50+</h3>
                <p>Space Missions</p>
              </div>
              <div className="about-stat">
                <h3>1M+</h3>
                <p>CHIMP Tokens Staked</p>
              </div>
            </div>
          </div>
          <div className="about-image">
            <img src="/images/moonchimp-squad.jpg" alt="MoonChimp Squad" />
            <div className="image-decoration"></div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default AboutSection;
'@ | Out-File -FilePath "src/components/AboutSection.js" -Encoding UTF8

# 6. AboutSection.css
@'
.about {
  padding: 5rem 2rem;
  background: #0f1520;
  position: relative;
}

.about-content {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 4rem;
  align-items: center;
}

.about-text {
  padding: 2rem;
}

.about-paragraph {
  font-size: 1.2rem;
  line-height: 1.8;
  color: #8892b0;
  margin-bottom: 1.5rem;
}

.about-stats {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 2rem;
  margin-top: 3rem;
}

.about-stat {
  text-align: center;
  padding: 1.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 15px;
  transition: all 0.3s ease;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.about-stat:hover {
  transform: scale(1.05);
  background: rgba(52, 152, 219, 0.1);
  border-color: #3498db;
}

.about-stat h3 {
  font-size: 2.5rem;
  color: #3498db;
  margin-bottom: 0.5rem;
  font-weight: 700;
}

.about-stat p {
  color: #8892b0;
  font-size: 1.1rem;
}

.about-image {
  position: relative;
  height: 500px;
  border-radius: 20px;
  overflow: hidden;
}

.about-image img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  border-radius: 20px;
}

.image-decoration {
  position: absolute;
  top: -20px;
  right: -20px;
  width: 100%;
  height: 100%;
  border: 3px solid #3498db;
  border-radius: 20px;
  z-index: -1;
}

@media (max-width: 768px) {
  .about-content {
    grid-template-columns: 1fr;
  }
  
  .about-stats {
    grid-template-columns: 1fr;
  }
  
  .about-image {
    height: 300px;
  }
}
'@ | Out-File -FilePath "src/components/AboutSection.css" -Encoding UTF8

# 7. GameIntegration.js
@'
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
    <div className="game-integration">
      <div className="container">
        <h2 className="section-title">Play MoonChimp</h2>
        <p className="section-subtitle">Launch into the ultimate space adventure</p>
        
        {!gameLoaded && !loading && (
          <div className="pre-game">
            <div className="game-preview">
              <img src="/images/game-preview.jpg" alt="Game Preview" />
              <button className="play-button" onClick={loadGame}>
                <span className="play-icon">▶</span>
                Launch Game
              </button>
            </div>
            <div className="game-features">
              <div className="feature">
                <h3>🎮 Immersive Gameplay</h3>
                <p>Experience stunning 3D graphics and smooth controls</p>
              </div>
              <div className="feature">
                <h3>🏆 Competitive Modes</h3>
                <p>Battle against players worldwide in ranked matches</p>
              </div>
              <div className="feature">
                <h3>🎯 Daily Missions</h3>
                <p>Complete challenges to earn rewards and unlock content</p>
              </div>
            </div>
          </div>
        )}
        
        {loading && (
          <div className="loading-screen">
            <div className="loading-content">
              <div className="loading-logo">🐵</div>
              <div className="loading-bar">
                <div className="loading-progress" style={{ width: `${loadingProgress}%` }}>
                  <span className="loading-glow"></span>
                </div>
              </div>
              <p className="loading-text">Loading MoonChimp Universe... {loadingProgress.toFixed(0)}%</p>
            </div>
          </div>
        )}
        
        <div className={`game-container ${gameLoaded ? 'active' : ''}`} ref={gameContainerRef}>
          {gameLoaded && (
            <>
              <button className="fullscreen-button" onClick={toggleFullscreen}>
                <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                  <path d="M0 0h6v2H2v4H0V0zM14 0h6v6h-2V2h-4V0zM0 14h2v4h4v2H0v-6zM14 18h4v-4h2v6h-6v-2z"/>
                </svg>
              </button>
              <div className="game-controls">
                <button className="control-button">Inventory</button>
                <button className="control-button">Map</button>
                <button className="control-button">Settings</button>
              </div>
            </>
          )}
        </div>
        
        {!gameLoaded && (
          <div className="controls-info">
            <h3>Game Controls</h3>
            <div className="controls-grid">
              <div className="control">
                <span className="key">WASD</span>
                <span className="action">Move</span>
              </div>
              <div className="control">
                <span className="key">Mouse</span>
                <span className="action">Look/Aim</span>
              </div>
              <div className="control">
                <span className="key">Space</span>
                <span className="action">Jump</span>
              </div>
              <div className="control">
                <span className="key">E</span>
                <span className="action">Interact</span>
              </div>
              <div className="control">
                <span className="key">Tab</span>
                <span className="action">Inventory</span>
              </div>
              <div className="control">
                <span className="key">ESC</span>
                <span className="action">Menu</span>
              </div>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default GameIntegration;
'@ | Out-File -FilePath "src/components/GameIntegration.js" -Encoding UTF8

# 8. GameIntegration.css
@'
.game-integration {
  padding: 5rem 2rem;
  background: linear-gradient(180deg, #0f1520 0%, #1a1f2e 100%);
}

.pre-game {
  max-width: 1200px;
  margin: 0 auto;
}

.game-preview {
  position: relative;
  border-radius: 20px;
  overflow: hidden;
  margin-bottom: 3rem;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
}

.game-preview img {
  width: 100%;
  height: 500px;
  object-fit: cover;
}

.play-button {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  border: none;
  padding: 1.5rem 3rem;
  font-size: 1.5rem;
  border-radius: 50px;
  cursor: pointer;
  display: flex;
  align-items: center;
  gap: 1rem;
  transition: all 0.3s ease;
  box-shadow: 0 10px 30px rgba(52, 152, 219, 0.5);
}

.play-button:hover {
  transform: translate(-50%, -50%) scale(1.05);
  box-shadow: 0 15px 40px rgba(52, 152, 219, 0.7);
}

.play-icon {
  font-size: 2rem;
}

.game-features {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-bottom: 3rem;
}

.feature {
  text-align: center;
  padding: 2rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 15px;
  border: 1px solid rgba(255, 255, 255, 0.1);
}

.feature h3 {
  font-size: 1.5rem;
  color: #3498db;
  margin-bottom: 1rem;
}

.feature p {
  color: #8892b0;
  line-height: 1.6;
}

.loading-screen {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background: rgba(10, 14, 26, 0.95);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 1000;
}

.loading-content {
  text-align: center;
}

.loading-logo {
  font-size: 5rem;
  margin-bottom: 2rem;
  animation: bounce 1s ease-in-out infinite;
}

@keyframes bounce {
  0%, 100% { transform: translateY(0); }
  50% { transform: translateY(-20px); }
}

.loading-bar {
  width: 300px;
  height: 8px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 4px;
  overflow: hidden;
  margin: 0 auto 1rem;
}

.loading-progress {
  height: 100%;
  background: linear-gradient(90deg, #3498db, #2ecc71);
  border-radius: 4px;
  position: relative;
  transition: width 0.3s ease;
}

.loading-glow {
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  width: 50px;
  background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.3), transparent);
  animation: glow-slide 1s ease-in-out infinite;
}

@keyframes glow-slide {
  from { transform: translateX(-50px); }
  to { transform: translateX(50px); }
}

.loading-text {
  color: white;
  font-size: 1.2rem;
}

.game-container {
  max-width: 1200px;
  margin: 0 auto;
  height: 700px;
  background: #0a0e1a;
  border-radius: 20px;
  overflow: hidden;
  position: relative;
  opacity: 0;
  transform: scale(0.9);
  transition: all 0.5s ease;
  box-shadow: 0 20px 50px rgba(0, 0, 0, 0.5);
}

.game-container.active {
  opacity: 1;
  transform: scale(1);
}

#unity-canvas {
  width: 100%;
  height: 100%;
}

.fullscreen-button {
  position: absolute;
  bottom: 20px;
  right: 20px;
  background: rgba(0, 0, 0, 0.7);
  color: white;
  border: none;
  padding: 10px 15px;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
  z-index: 10;
}

.fullscreen-button:hover {
  background: rgba(0, 0, 0, 0.9);
  transform: scale(1.1);
}

.game-controls {
  position: absolute;
  bottom: 20px;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
  gap: 1rem;
  z-index: 10;
}

.control-button {
  background: rgba(0, 0, 0, 0.7);
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.control-button:hover {
  background: #3498db;
}

.controls-info {
  background: rgba(255, 255, 255, 0.05);
  padding: 2rem;
  border-radius: 15px;
  max-width: 800px;
  margin: 3rem auto 0;
  text-align: center;
}

.controls-info h3 {
  color: #3498db;
  font-size: 1.5rem;
  margin-bottom: 1.5rem;
}

.controls-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
  gap: 1rem;
}

.control {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}

.key {
  background: #1a1f2e;
  color: white;
  padding: 0.5rem 1rem;
  border-radius: 8px;
  font-weight: bold;
  border: 2px solid #3498db;
}

.action {
  color: #8892b0;
}

@media (max-width: 768px) {
  .game-container {
    height: 400px;
  }
  
  .game-controls {
    flex-direction: column;
    bottom: 10px;
  }
  
  .control-button {
    padding: 8px 16px;
    font-size: 0.9rem;
  }
}
'@ | Out-File -FilePath "src/components/GameIntegration.css" -Encoding UTF8

# Now let's update the main App.js to include all components
@'
import React from 'react';
import './App.css';
import HeroSection from './components/HeroSection';
import FeaturesSection from './components/FeaturesSection';
import AboutSection from './components/AboutSection';
import GameIntegration from './components/GameIntegration';

function App() {
  return (
    <div className="App">
      <nav className="navbar">
        <div className="nav-container">
          <div className="logo">
            <span className="logo-icon">🐵</span>
            <h1>MoonChimp.io</h1>
          </div>
          <div className="nav-links">
            <a href="#home">Home</a>
            <a href="#features">Features</a>
            <a href="#about">About</a>
            <a href="#game">Play</a>
            <a href="#nft">NFTs</a>
            <a href="#tokenomics">Tokenomics</a>
            <a href="#roadmap">Roadmap</a>
            <a href="#community">Community</a>
          </div>
          <button className="connect-wallet">Connect Wallet</button>
        </div>
      </nav>

      <section id="home">
        <HeroSection />
      </section>
      
      <section id="features">
        <FeaturesSection />
      </section>
      
      <section id="about">
        <AboutSection />
      </section>
      
      <section id="game">
        <GameIntegration />
      </section>
      
      <footer className="footer">
        <div className="footer-content">
          <div className="footer-section">
            <h3>MoonChimp.io</h3>
            <p>The Ultimate Space Adventure Game</p>
            <div className="social-links">
              <a href="#">Twitter</a>
              <a href="#">Discord</a>
              <a href="#">Telegram</a>
            </div>
          </div>
          <div className="footer-section">
            <h4>Quick Links</h4>
            <a href="#game">Play Game</a>
            <a href="#nft">NFT Marketplace</a>
            <a href="#tokenomics">Buy $CHIMP</a>
            <a href="#community">Join Community</a>
          </div>
          <div className="footer-section">
            <h4>Resources</h4>
            <a href="#">Whitepaper</a>
            <a href="#">Documentation</a>
            <a href="#">Smart Contract</a>
            <a href="#">Press Kit</a>
          </div>
        </div>
        <div className="footer-bottom">
          <p>&copy; 2025 MoonChimp.io. All rights reserved.</p>
        </div>
      </footer>
    </div>
  );
}

export default App;
'@ | Out-File -FilePath "src/App.js" -Encoding UTF8

# Update App.css with complete styling
@'
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

@import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Space+Grotesk:wght@300;400;500;700&display=swap');

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
  transition: all 0.3s ease;
}

.nav-container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 2rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.logo {
  display: flex;
  align-items: center;
  gap: 0.5rem;
}

.logo-icon {
  font-size: 2rem;
}

.logo h1 {
  font-family: 'Orbitron', sans-serif;
  font-size: 1.8rem;
  background: linear-gradient(45deg, #3498db, #2ecc71);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.nav-links {
  display: flex;
  gap: 2rem;
  align-items: center;
}

.nav-links a {
  color: #ffffff;
  text-decoration: none;
  font-weight: 500;
  transition: color 0.3s ease;
  position: relative;
}

.nav-links a::after {
  content: '';
  position: absolute;
  bottom: -5px;
  left: 0;
  width: 0;
  height: 2px;
  background: #3498db;
  transition: width 0.3s ease;
}

.nav-links a:hover {
  color: #3498db;
}

.nav-links a:hover::after {
  width: 100%;
}

.connect-wallet {
  background: linear-gradient(45deg, #3498db, #2ecc71);
  color: white;
  border: none;
  padding: 0.7rem 2rem;
  border-radius: 25px;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(52, 152, 219, 0.3);
}

.connect-wallet:hover {
  transform: translateY(-2px);
  box-shadow: 0 6px 20px rgba(52, 152, 219, 0.5);
}

/* Section Styles */
section {
  padding-top: 5rem;
  position: relative;
}

/* Footer Styles */
.footer {
  background: #0a0e1a;
  padding: 4rem 2rem 2rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  margin-top: 5rem;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 3rem;
  margin-bottom: 3rem;
}

.footer-section h3,
.footer-section h4 {
  margin-bottom: 1.5rem;
  color: #3498db;
}

.footer-section h3 {
  font-size: 1.5rem;
  font-family: 'Orbitron', sans-serif;
}

.footer-section a {
  display: block;
  color: #8892b0;
  text-decoration: none;
  margin: 0.5rem 0;
  transition: color 0.3s ease;
}

.footer-section a:hover {
  color: #ffffff;
}

.social-links {
  display: flex;
  gap: 1rem;
  margin-top: 1rem;
}

.social-links a {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 40px;
  height: 40px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 50%;
  transition: all 0.3s ease;
}

.social-links a:hover {
  background: #3498db;
  transform: translateY(-2px);
}

.footer-bottom {
  text-align: center;
  padding-top: 2rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  color: #8892b0;
}

/* Responsive Design */
@media (max-width: 768px) {
  .nav-links {
    display: none;
  }
  
  .nav-container {
    padding: 0 1rem;
  }
  
  .footer-content {
    grid-template-columns: 1fr;
    text-align: center;
  }
  
  .social-links {
    justify-content: center;
  }
}

/* Scrollbar Styling */
::-webkit-scrollbar {
  width: 10px;
}

::-webkit-scrollbar-track {
  background: #0a0e1a;
}

::-webkit-scrollbar-thumb {
  background: #3498db;
  border-radius: 5px;
}

::-webkit-scrollbar-thumb:hover {
  background: #2ecc71;
}
'@ | Out-File -FilePath "src/App.css" -Encoding UTF8

Write-Host "✅ All components created successfully!" -ForegroundColor Green
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. Make sure the components folder exists" -ForegroundColor Cyan
Write-Host "2. Restart your development server with: npm start" -ForegroundColor Cyan
Write-Host "`nYour MoonChimp.io website now has:" -ForegroundColor Green
Write-Host "- Hero Section with space theme" -ForegroundColor White
Write-Host "- Features Section with 6 game features" -ForegroundColor White
Write-Host "- About Section with backstory" -ForegroundColor White
Write-Host "- Game Integration ready for Unity WebGL" -ForegroundColor White
Write-Host "- Professional styling throughout" -ForegroundColor White
