// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Initialize variables
    let walletConnected = false;
    let publicKey = null;
    
    // UI Elements
    const walletConnectBtn = document.getElementById('wallet-connect-btn');
    const walletConnectPromptBtn = document.getElementById('wallet-connect-prompt-btn');
    const walletStatus = document.getElementById('wallet-status');
    const walletAddress = document.getElementById('wallet-address');
    const disconnectBtn = document.getElementById('disconnect-btn');
    const connectPrompt = document.getElementById('connect-prompt');
    const purchaseForm = document.querySelector('.purchase-form');
    const tokenAmountInput = document.getElementById('token-amount');
    const totalCostDisplay = document.getElementById('total-cost');
    const buyBtn = document.getElementById('buy-btn');
    const transactionModal = document.getElementById('transaction-modal');
    const closeModalBtn = document.querySelector('.close-btn');
    const transactionStatus = document.getElementById('transaction-status');
    const currentPhaseElement = document.getElementById('current-phase');
    const tokenPriceElement = document.getElementById('token-price');
    const tokensSoldElement = document.getElementById('tokens-sold');
    const timeRemainingElement = document.getElementById('time-remaining');
    
    // Token price per phase
    const phaseDetails = {
        1: { price: 0.007, total: 100 },
        2: { price: 0.008, total: 150 },
        3: { price: 0.009, total: 200 }
    };
    
    let currentPhase = 1;
    let tokensSold = 35;
    
    // Connect wallet
    async function connectWallet() {
        try {
            // In production, this would connect to actual wallet provider
            // For demo, we'll simulate a connection
            if (window.ethereum) {
                const accounts = await window.ethereum.request({ method: 'eth_requestAccounts' });
                handleWalletConnection(accounts[0]);
            } else if (window.solana) {
                const response = await window.solana.connect();
                handleWalletConnection(response.publicKey.toString());
            } else {
                // Simulate connection for demo
                const mockAddress = 'Sol' + Math.random().toString(36).substr(2, 6) + '...X' + Math.random().toString(36).substr(2, 4);
                handleWalletConnection(mockAddress);
            }
        } catch (error) {
            console.error('Error connecting wallet:', error);
            alert('Failed to connect wallet. Please try again.');
        }
    }
    
    // Handle successful wallet connection
    function handleWalletConnection(address) {
        publicKey = address;
        walletConnected = true;
        
        // Update UI to show connected state
        walletConnectBtn.classList.add('hidden');
        walletStatus.classList.remove('hidden');
        
        // Format and display wallet address
        const formattedAddress = formatAddress(address);
        walletAddress.textContent = formattedAddress;
        
        // Update purchase section
        if (connectPrompt && purchaseForm) {
            connectPrompt.style.display = 'none';
            purchaseForm.style.display = 'block';
        }
        
        console.log(`Connected to wallet: ${address}`);
    }
    
    // Disconnect wallet
    function disconnectWallet() {
        publicKey = null;
        walletConnected = false;
        
        // Update UI to show disconnected state
        walletConnectBtn.classList.remove('hidden');
        walletStatus.classList.add('hidden');
        
        // Update purchase section
        if (connectPrompt && purchaseForm) {
            connectPrompt.style.display = 'block';
            purchaseForm.style.display = 'none';
        }
        
        console.log('Disconnected from wallet');
    }
    
    // Format wallet address for display
    function formatAddress(address) {
        if (!address) return '';
        if (address.length < 10) return address;
        return `${address.substring(0, 6)}...${address.substring(address.length - 4)}`;
    }
    
    // Calculate total cost based on token amount
    function calculateTotalCost() {
        const amount = parseInt(tokenAmountInput.value) || 0;
        const price = phaseDetails[currentPhase].price;
        const total = (amount * price).toFixed(6);
        totalCostDisplay.textContent = `${total} SOL`;
    }
    
    // Update phase information
    function updatePhaseInfo() {
        // Check if we need to move to next phase
        if (tokensSold >= phaseDetails[currentPhase].total && currentPhase < 3) {
            currentPhase++;
            tokensSold = 0;
        }
        
        // Update UI
        currentPhaseElement.textContent = `Phase ${currentPhase}`;
        tokenPriceElement.textContent = `${phaseDetails[currentPhase].price} SOL`;
        tokensSoldElement.textContent = `${tokensSold}/${phaseDetails[currentPhase].total}`;
        
        // Update progress bars
        const progressBars = document.querySelectorAll('.progress-bar');
        progressBars.forEach((bar, index) => {
            if (index + 1 === currentPhase) {
                const percentage = (tokensSold / phaseDetails[currentPhase].total) * 100;
                bar.style.width = `${percentage}%`;
            } else if (index + 1 < currentPhase) {
                bar.style.width = '100%';
            } else {
                bar.style.width = '0%';
            }
        });
        
        // Update phase cards
        const phaseCards = document.querySelectorAll('.phase-card');
        phaseCards.forEach((card, index) => {
            if (index + 1 === currentPhase) {
                card.classList.add('active');
                card.querySelector('.phase-badge').textContent = 'Active';
            } else {
                card.classList.remove('active');
                card.querySelector('.phase-badge').textContent = 'Coming Soon';
            }
        });
    }
    
    // Buy tokens
    async function buyTokens() {
        if (!walletConnected) {
            alert('Please connect your wallet first');
            return;
        }
        
        const amount = parseInt(tokenAmountInput.value) || 0;
        if (amount <= 0) {
            alert('Please enter a valid amount of tokens');
            return;
        }
        
        const price = phaseDetails[currentPhase].price;
        const totalCost = (amount * price).toFixed(6);
        
        // Show transaction modal
        transactionModal.style.display = 'block';
        transactionStatus.innerHTML = `
            <div style="text-align: center;">
                <div style="margin-bottom: 20px;">
                    <div class="loading-spinner"></div>
                </div>
                <h3 style="color: #FFD700; margin-bottom: 15px;">Processing Transaction</h3>
                <p>Purchasing ${amount} MoonChimp tokens for ${totalCost} SOL</p>
                <p style="color: rgba(255,255,255,0.7); margin-top: 15px;">Please confirm the transaction in your wallet...</p>
            </div>
        `;
        
        try {
            // Simulate transaction delay
            await new Promise(resolve => setTimeout(resolve, 3000));
            
            // Transaction success
            transactionStatus.innerHTML = `
                <div style="text-align: center;">
                    <div style="margin-bottom: 20px;">
                        <div class="success-checkmark">✓</div>
                    </div>
                    <h3 style="color: #4CAF50; margin-bottom: 15px;">Transaction Successful!</h3>
                    <p>You have successfully purchased ${amount} MoonChimp tokens for ${totalCost} SOL</p>
                    <p style="color: rgba(255,255,255,0.7); margin-top: 15px;">Tokens will be available in your wallet soon.</p>
                </div>
            `;
            
            // Update tokens sold
            tokensSold += amount;
            updatePhaseInfo();
            
        } catch (error) {
            console.error('Transaction failed:', error);
            
            // Transaction failure
            transactionStatus.innerHTML = `
                <div style="text-align: center;">
                    <div style="margin-bottom: 20px;">
                        <div class="error-x">✗</div>
                    </div>
                    <h3 style="color: #e63946; margin-bottom: 15px;">Transaction Failed</h3>
                    <p>There was an error processing your transaction.</p>
                    <p style="color: rgba(255,255,255,0.7); margin-top: 15px;">Please try again later.</p>
                </div>
            `;
        }
    }
    
    // Close the transaction modal
    function closeModal() {
        transactionModal.style.display = 'none';
    }
    
    // Update countdown timer
    function updateCountdown() {
        const endDate = new Date("May 31, 2025 00:00:00").getTime();
        const now = new Date().getTime();
        const distance = endDate - now;
        
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        timeRemainingElement.textContent = `${days} Days`;
        
        if (distance < 0) {
            timeRemainingElement.textContent = "ENDED";
        }
    }
    
    // Initialize
    function init() {
        // Initial setup
        if (connectPrompt && purchaseForm) {
            connectPrompt.style.display = 'block';
            purchaseForm.style.display = 'none';
        }
        
        // Update phase info
        updatePhaseInfo();
        
        // Calculate initial total cost
        calculateTotalCost();
        
        // Start countdown timer
        updateCountdown();
        setInterval(updateCountdown, 60000); // Update every minute
        
        // Add event listeners
        if (walletConnectBtn) {
            walletConnectBtn.addEventListener('click', connectWallet);
        }
        
        if (walletConnectPromptBtn) {
            walletConnectPromptBtn.addEventListener('click', connectWallet);
        }
        
        if (disconnectBtn) {
            disconnectBtn.addEventListener('click', disconnectWallet);
        }
        
        if (tokenAmountInput) {
            tokenAmountInput.addEventListener('input', calculateTotalCost);
        }
        
        if (buyBtn) {
            buyBtn.addEventListener('click', buyTokens);
        }
        
        if (closeModalBtn) {
            closeModalBtn.addEventListener('click', closeModal);
            
            // Also close modal when clicking outside of it
            window.addEventListener('click', function(event) {
                if (event.target === transactionModal) {
                    closeModal();
                }
            });
        }
    }
    
    // Initialize when DOM is ready
    init();
});
