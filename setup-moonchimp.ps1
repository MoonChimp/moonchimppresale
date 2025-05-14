# Quick Setup Instructions

# Step 1: Create the PowerShell script directly from the command line
# Run this command in PowerShell to create the setup script:

@'
# MoonChimp.io Complete Setup Script - Master File
# This is the main script that sets up the entire project

$projectName = "moonchimp-io"
$currentLocation = Get-Location
$projectRoot = Join-Path $currentLocation $projectName

Write-Host "🚀 MoonChimp.io Complete Setup Script 🐵" -ForegroundColor Cyan
Write-Host "======================================`n" -ForegroundColor Cyan

# Function to create directory if it doesn't exist
function Ensure-Directory {
    param($Path)
    if (!(Test-Path $Path)) {
        Write-Host "Creating directory: $Path" -ForegroundColor Yellow
        New-Item -ItemType Directory -Path $Path -Force | Out-Null
    }
}

# Step 1: Create directory structure
Write-Host "Step 1: Creating directory structure..." -ForegroundColor Green
Ensure-Directory $projectRoot
Ensure-Directory "$projectRoot\src"
Ensure-Directory "$projectRoot\src\components"
Ensure-Directory "$projectRoot\src\utils"
Ensure-Directory "$projectRoot\public"
Ensure-Directory "$projectRoot\public\build"
Ensure-Directory "$projectRoot\public\images"

# Navigate to project root
Set-Location $projectRoot

# Step 2: Initialize npm and install dependencies
Write-Host "`nStep 2: Initializing npm project..." -ForegroundColor Green
npm init -y

Write-Host "Installing React and dependencies..." -ForegroundColor Yellow
npm install react react-dom react-router-dom web3@1.10.0 recharts framer-motion axios
npm install react-scripts

# Step 3: Create all component files
Write-Host "`nStep 3: Creating React components..." -ForegroundColor Green

# App.js
$appContent = @"
import React from 'react';
import './App.css';
import HeroSection from './components/HeroSection';
import FeaturesSection from './components/FeaturesSection';
import AboutSection from './components/AboutSection';
import GameIntegration from './components/GameIntegration';
import NFTMarketplace from './components/NFTMarketplace';
import TokenomicsSection from './components/TokenomicsSection';
import RoadmapSection from './components/RoadmapSection';
import CommunityHub from './components/CommunityHub';
import MobileARExperience from './components/MobileARExperience';

function App() {
  return (
    <div className="App">
      <nav className="navbar">
        <div className="navContainer">
          <div className="logo">
            <h1>MoonChimp.io</h1>
          </div>
          <div className="navLinks">
            <a href="#home">Home</a>
            <a href="#features">Features</a>
            <a href="#about">About</a>
            <a href="#game">Play</a>
            <a href="#nft">NFTs</a>
            <a href="#tokenomics">Tokenomics</a>
            <a href="#roadmap">Roadmap</a>
            <a href="#community">Community</a>
          </div>
          <button className="connectWallet">Connect Wallet</button>
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
      
      <section id="nft">
        <NFTMarketplace />
      </section>
      
      <section id="tokenomics">
        <TokenomicsSection />
      </section>
      
      <section id="roadmap">
        <RoadmapSection />
      </section>
      
      <section id="community">
        <CommunityHub />
      </section>
      
      <MobileARExperience />
      
      <footer className="footer">
        <div className="footerContainer">
          <div className="footerContent">
            <div className="footerSection">
              <h3>MoonChimp.io</h3>
              <p>The Ultimate Space Adventure Game</p>
            </div>
            <div className="footerSection">
              <h4>Quick Links</h4>
              <a href="#game">Play Game</a>
              <a href="#nft">NFT Marketplace</a>
              <a href="#tokenomics">Buy \$CHIMP</a>
              <a href="#community">Join Community</a>
            </div>
            <div className="footerSection">
              <h4>Community</h4>
              <a href="#">Discord</a>
              <a href="#">Twitter</a>
              <a href="#">Telegram</a>
              <a href="#">Reddit</a>
            </div>
            <div className="footerSection">
              <h4>Resources</h4>
              <a href="#">Whitepaper</a>
              <a href="#">Documentation</a>
              <a href="#">Smart Contract</a>
              <a href="#">Press Kit</a>
            </div>
          </div>
          <div className="footerBottom">
            <p>&copy; 2025 MoonChimp.io. All rights reserved.</p>
          </div>
        </div>
      </footer>
    </div>
  );
}

export default App;
"@
$appContent | Out-File -FilePath "$projectRoot\src\App.js" -Encoding UTF8

Write-Host "✅ Setup Complete!" -ForegroundColor Green
Write-Host "`nYour MoonChimp.io project has been created at: $projectRoot" -ForegroundColor Cyan
Write-Host "`nNext steps:" -ForegroundColor Yellow
Write-Host "1. cd $projectRoot"
Write-Host "2. npm start"
'@ | Out-File -FilePath "setup-moonchimp.ps1" -Encoding UTF8

# Step 2: Make the script executable (optional)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser -Force

# Step 3: Run the script
Write-Host "Script created! Now run it with:" -ForegroundColor Green
Write-Host ".\setup-moonchimp.ps1" -ForegroundColor Cyan
