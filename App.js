// Wait for the DOM to be fully loaded
document.addEventListener('DOMContentLoaded', function() {
    // Configuration
    const appkitProjectId = '287cdf73678b3347707785914cad8b6a';
    let solanaConnection = null;
    let publicKey = null;
    let walletConnected = false;
    
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
    
    // Initialize Solana connection
    function initializeSolana() {
        try {
            // Connect to Solana devnet
            solanaConnection = new solanaWeb3.Connection(
                solanaWeb3.clusterApiUrl('devnet'),
                'confirmed'
            );
            console.log('Connected to Solana devnet');
        } catch (error) {
            console.error('Failed to connect to Solana network:', error);
        }
    }
    
    // Simple wallet connection for testing
    function connectWallet() {
        // For testing purposes, create a fake wallet address
        const fakeAddress = 'DemoWallet' + Math.random().toString(36).substring(7);
        handleWalletConnection(fakeAddress);
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
            connectPrompt.classList.add('hidden');
            purchaseForm.classList.remove('hidden');
        }
        
        console.log('Connected to wallet: ' + address);
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
            connectPrompt.classList.remove('hidden');
            purchaseForm.classList.add('hidden');
        }
        
        console.log('Disconnected from wallet');
    }
    
    // Format wallet address for display
    function formatAddress(address) {
        if (!address) return '';
        return address.substring(0, 6) + '...' + address.substring(address.length - 4);
    }
    
    // Calculate total cost based on token amount
    function calculateTotalCost() {
        const amount = parseInt(tokenAmountInput.value) || 0;
        const price = 0.007; // Current phase price
        const total = (amount * price).toFixed(6);
        totalCostDisplay.textContent = total + ' SOL';
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
        
        const price = 0.007; // Current phase price
        const totalCost = (amount * price).toFixed(6);
        
        // Show transaction modal
        transactionModal.style.display = 'block';
        
        // Create loading spinner element
        const loadingSpinner = document.createElement('div');
        loadingSpinner.className = 'loading-spinner';
        
        // Create status container
        const statusContainer = document.createElement('div');
        statusContainer.innerHTML = '<h3>Processing Transaction</h3>' +
            '<p>Purchasing ' + amount + ' MoonChimp tokens for ' + totalCost + ' SOL</p>' +
            '<p>Please confirm the transaction in your wallet...</p>';
        
        // Clear transaction status and add elements
        transactionStatus.innerHTML = '';
        transactionStatus.appendChild(loadingSpinner);
        transactionStatus.appendChild(statusContainer);
        
        try {
            // Simulate transaction delay
            await new Promise(resolve => setTimeout(resolve, 3000));
            
            // Transaction success
            transactionStatus.innerHTML = '';
            
            const successCheckmark = document.createElement('div');
            successCheckmark.className = 'success-checkmark';
            successCheckmark.textContent = '✓';
            
            const successContainer = document.createElement('div');
            successContainer.innerHTML = '<h3>Transaction Successful!</h3>' +
                '<p>You have successfully purchased ' + amount + ' MoonChimp tokens for ' + totalCost + ' SOL</p>' +
                '<p>Tokens will be available in your wallet soon.</p>';
            
            transactionStatus.appendChild(successCheckmark);
            transactionStatus.appendChild(successContainer);
            
            // Update the UI to show the new token sold count
            setTimeout(() => {
                // This would be replaced with actual blockchain data in production
                const tokensSoldElement = document.getElementById('tokens-sold');
                const parts = tokensSoldElement.textContent.split('/');
                const currentSold = parseInt(parts[0].replace(/,/g, ''));
                const total = parseInt(parts[1].replace(/,/g, ''));
                const newSold = currentSold + amount;
                
                const formattedSold = newSold.toLocaleString();
                const formattedTotal = total.toLocaleString();
                tokensSoldElement.textContent = formattedSold + '/' + formattedTotal;
                
                // Update the progress bar
                const progressBar = document.querySelector('.progress-bar');
                const newWidth = (newSold / total) * 100;
                progressBar.style.width = newWidth + '%';
            }, 2000);
            
        } catch (error) {
            console.error('Transaction failed:', error);
            
            // Transaction failure
            transactionStatus.innerHTML = '';
            
            const errorX = document.createElement('div');
            errorX.className = 'error-x';
            errorX.textContent = '✗';
            
            const errorContainer = document.createElement('div');
            errorContainer.innerHTML = '<h3>Transaction Failed</h3>' +
                '<p>There was an error processing your transaction.</p>' +
                '<p>Please try again later.</p>';
            
            transactionStatus.appendChild(errorX);
            transactionStatus.appendChild(errorContainer);
        }
    }
    
    // Close the transaction modal
    function closeModal() {
        transactionModal.style.display = 'none';
    }
    
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
    
    // Initialize Solana connection
    initializeSolana();
    
    // Initial UI setup
    if (connectPrompt && purchaseForm) {
        connectPrompt.style.display = 'block';
        purchaseForm.style.display = 'none';
    }
    
    // Calculate initial total cost
    calculateTotalCost();
    
    // Add styles for the loading spinner and success/error indicators
    const style = document.createElement('style');
    style.textContent = '.loading-spinner {' +
        'width: 50px;' +
        'height: 50px;' +
        'border: 5px solid rgba(255, 255, 255, 0.3);' +
        'border-radius: 50%;' +
        'border-top-color: #FFD700;' +
        'animation: spin 1s ease-in-out infinite;' +
        'margin: 0 auto;' +
        '}' +
        '@keyframes spin {' +
        'to { transform: rotate(360deg); }' +
        '}' +
        '.success-checkmark {' +
        'font-size: 50px;' +
        'color: #4CAF50;' +
        '}' +
        '.error-x {' +
        'font-size: 50px;' +
        'color: #e63946;' +
        '}';
    document.head.appendChild(style);
    
    // Add countdown timer functionality
    const countdownDate = new Date("May 31, 2025 00:00:00").getTime();
    
    function updateCountdown() {
        const now = new Date().getTime();
        const distance = countdownDate - now;
        
        if (distance < 0) {
            clearInterval(countdownInterval);
            document.getElementById("time-remaining").textContent = "ENDED";
            return;
        }
        
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        // Update the display
        document.getElementById("time-remaining").textContent = days + ' Days';
    }
    
    // Update the countdown every second
    const countdownInterval = setInterval(updateCountdown, 1000);
    updateCountdown(); // Initial call
});
