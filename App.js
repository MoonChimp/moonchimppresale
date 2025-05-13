// MoonChimp Token Presale - Production Ready
document.addEventListener('DOMContentLoaded', function() {
    // Configuration
    const TOKEN_PRICE = 0.007; // Price in SOL per token
    const RECEIVER_WALLET = "YOUR_RECEIVER_WALLET_ADDRESS"; // Replace with your wallet
    const PRESALE_END_DATE = "May 31, 2025 00:00:00";
    
    let solanaConnection = null;
    let walletAdapter = null;
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
    async function initializeSolana() {
        try {
            // Connect to mainnet-beta for production, devnet for testing
            const network = 'devnet'; // Change to 'mainnet-beta' for production
            solanaConnection = new solanaWeb3.Connection(
                solanaWeb3.clusterApiUrl(network),
                'confirmed'
            );
            console.log(`Connected to Solana ${network}`);
            
            // Check if Phantom is installed
            if (!window.solana || !window.solana.isPhantom) {
                console.log('Phantom wallet not detected');
            } else {
                walletAdapter = window.solana;
                console.log('Phantom wallet detected');
                
                // Auto-connect if previously connected
                if (walletAdapter.isConnected) {
                    await connectWallet(true);
                }
            }
        } catch (error) {
            console.error('Failed to connect to Solana network:', error);
            showError('Failed to connect to Solana network');
        }
    }
    
    // Connect Phantom wallet
    async function connectWallet(silent = false) {
        try {
            if (!walletAdapter) {
                if (!silent) {
                    if (confirm('Phantom wallet not detected. Would you like to install it?')) {
                        window.open('https://phantom.app/', '_blank');
                    }
                }
                return;
            }
            
            const response = await walletAdapter.connect();
            publicKey = response.publicKey;
            walletConnected = true;
            
            handleWalletConnection(publicKey.toString());
            
            // Listen for disconnect
            walletAdapter.on('disconnect', () => {
                disconnectWallet();
            });
            
            // Listen for account change
            walletAdapter.on('accountChanged', (publicKey) => {
                if (publicKey) {
                    handleWalletConnection(publicKey.toString());
                }
            });
            
        } catch (error) {
            console.error('Error connecting wallet:', error);
            if (!silent) {
                showError('Failed to connect wallet');
            }
        }
    }
    
    // Handle successful wallet connection
    function handleWalletConnection(address) {
        walletConnected = true;
        publicKey = new solanaWeb3.PublicKey(address);
        
        // Update UI
        if (walletConnectBtn) walletConnectBtn.classList.add('hidden');
        if (walletStatus) walletStatus.classList.remove('hidden');
        
        // Format and display wallet address
        const formattedAddress = formatAddress(address);
        if (walletAddress) walletAddress.textContent = formattedAddress;
        
        // Show purchase form
        if (connectPrompt && purchaseForm) {
            connectPrompt.classList.add('hidden');
            purchaseForm.classList.remove('hidden');
        }
        
        console.log('Connected to wallet:', address);
    }
    
    // Disconnect wallet
    async function disconnectWallet() {
        if (walletAdapter) {
            await walletAdapter.disconnect();
        }
        
        publicKey = null;
        walletConnected = false;
        
        // Update UI
        if (walletConnectBtn) walletConnectBtn.classList.remove('hidden');
        if (walletStatus) walletStatus.classList.add('hidden');
        
        // Hide purchase form
        if (connectPrompt && purchaseForm) {
            connectPrompt.classList.remove('hidden');
            purchaseForm.classList.add('hidden');
        }
        
        console.log('Disconnected from wallet');
    }
    
    // Format wallet address for display
    function formatAddress(address) {
        if (!address) return '';
        const str = address.toString();
        return `${str.substring(0, 4)}...${str.substring(str.length - 4)}`;
    }
    
    // Calculate total cost based on token amount
    function calculateTotalCost() {
        const amount = parseInt(tokenAmountInput.value) || 0;
        const total = (amount * TOKEN_PRICE).toFixed(6);
        if (totalCostDisplay) totalCostDisplay.textContent = `${total} SOL`;
    }
    
    // Buy tokens with real Solana transaction
    async function buyTokens() {
        if (!walletConnected || !publicKey) {
            showError('Please connect your wallet first');
            return;
        }
        
        const amount = parseInt(tokenAmountInput.value) || 0;
        if (amount < 100) {
            showError('Minimum purchase is 100 tokens');
            return;
        }
        
        const totalCost = amount * TOKEN_PRICE;
        const lamports = Math.round(totalCost * solanaWeb3.LAMPORTS_PER_SOL);
        
        // Show transaction modal
        transactionModal.style.display = 'block';
        updateTransactionStatus(
            'loading',
            'Processing Transaction',
            `Purchasing ${amount.toLocaleString()} MoonChimp tokens for ${totalCost.toFixed(6)} SOL`,
            'Please confirm the transaction in your wallet...'
        );
        
        try {
            // Create transaction
            const transaction = new solanaWeb3.Transaction();
            
            // Add transfer instruction
            const transferInstruction = solanaWeb3.SystemProgram.transfer({
                fromPubkey: publicKey,
                toPubkey: new solanaWeb3.PublicKey(RECEIVER_WALLET),
                lamports: lamports
            });
            
            transaction.add(transferInstruction);
            
            // Get recent blockhash
            const { blockhash } = await solanaConnection.getLatestBlockhash();
            transaction.recentBlockhash = blockhash;
            transaction.feePayer = publicKey;
            
            // Send and confirm transaction
            const signedTransaction = await walletAdapter.signTransaction(transaction);
            const signature = await solanaConnection.sendRawTransaction(signedTransaction.serialize());
            
            // Wait for confirmation
            await solanaConnection.confirmTransaction(signature, 'confirmed');
            
            // Success
            updateTransactionStatus(
                'success',
                'Transaction Successful!',
                `You have successfully purchased ${amount.toLocaleString()} MoonChimp tokens for ${totalCost.toFixed(6)} SOL`,
                `Transaction ID: ${signature}`,
                'Tokens will be distributed to your wallet soon.'
            );
            
            // Update UI
            updateTokensSold(amount);
            
        } catch (error) {
            console.error('Transaction failed:', error);
            updateTransactionStatus(
                'error',
                'Transaction Failed',
                error.message || 'There was an error processing your transaction.',
                'Please try again.'
            );
        }
    }
    
    // Update transaction status modal
    function updateTransactionStatus(type, title, ...messages) {
        if (!transactionStatus) return;
        
        transactionStatus.innerHTML = '';
        
        if (type === 'loading') {
            const spinner = document.createElement('div');
            spinner.className = 'loading-spinner';
            transactionStatus.appendChild(spinner);
        } else if (type === 'success') {
            const checkmark = document.createElement('div');
            checkmark.className = 'success-checkmark';
            checkmark.textContent = '✓';
            transactionStatus.appendChild(checkmark);
        } else if (type === 'error') {
            const errorX = document.createElement('div');
            errorX.className = 'error-x';
            errorX.textContent = '✗';
            transactionStatus.appendChild(errorX);
        }
        
        const container = document.createElement('div');
        container.innerHTML = `<h3>${title}</h3>`;
        messages.forEach(msg => {
            const p = document.createElement('p');
            p.innerHTML = msg;
            container.appendChild(p);
        });
        
        transactionStatus.appendChild(container);
    }
    
    // Update tokens sold display
    function updateTokensSold(amountPurchased) {
        setTimeout(() => {
            const tokensSoldElement = document.getElementById('tokens-sold');
            if (!tokensSoldElement) return;
            
            const parts = tokensSoldElement.textContent.split('/');
            const currentSold = parseInt(parts[0].replace(/,/g, ''));
            const total = parseInt(parts[1].replace(/,/g, ''));
            const newSold = currentSold + amountPurchased;
            
            tokensSoldElement.textContent = `${newSold.toLocaleString()}/${total.toLocaleString()}`;
            
            // Update progress bar
            const progressBar = document.querySelector('.progress-bar');
            if (progressBar) {
                const newWidth = Math.min((newSold / total) * 100, 100);
                progressBar.style.width = `${newWidth}%`;
            }
        }, 2000);
    }
    
    // Show error message
    function showError(message) {
        const errorDiv = document.createElement('div');
        errorDiv.className = 'error-message';
        errorDiv.textContent = message;
        errorDiv.style.cssText = `
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: rgba(230, 57, 70, 0.9);
            padding: 15px 30px;
            border-radius: 8px;
            z-index: 9999;
        `;
        
        document.body.appendChild(errorDiv);
        
        setTimeout(() => {
            errorDiv.remove();
        }, 5000);
    }
    
    // Close modal
    function closeModal() {
        if (transactionModal) transactionModal.style.display = 'none';
    }
    
    // Event Listeners
    if (walletConnectBtn) {
        walletConnectBtn.addEventListener('click', () => connectWallet());
    }
    
    if (walletConnectPromptBtn) {
        walletConnectPromptBtn.addEventListener('click', () => connectWallet());
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
    }
    
    // Close modal on outside click
    window.addEventListener('click', (event) => {
        if (event.target === transactionModal) {
            closeModal();
        }
    });
    
    // Initialize
    initializeSolana();
    
    // Initial UI setup
    if (connectPrompt && purchaseForm) {
        connectPrompt.style.display = 'block';
        purchaseForm.style.display = 'none';
    }
    
    // Calculate initial cost
    calculateTotalCost();
    
    // Add dynamic styles
    const style = document.createElement('style');
    style.textContent = `
        .loading-spinner {
            width: 50px;
            height: 50px;
            border: 5px solid rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            border-top-color: #FFD700;
            animation: spin 1s ease-in-out infinite;
            margin: 0 auto 20px;
        }
        
        @keyframes spin {
            to { transform: rotate(360deg); }
        }
        
        .success-checkmark {
            font-size: 60px;
            color: #4CAF50;
            margin-bottom: 20px;
        }
        
        .error-x {
            font-size: 60px;
            color: #e63946;
            margin-bottom: 20px;
        }
        
        #transaction-status p {
            margin: 10px 0;
            line-height: 1.5;
        }
        
        #transaction-status small {
            word-break: break-all;
            font-size: 0.8em;
            color: #888;
        }
    `;
    document.head.appendChild(style);
    
    // Countdown Timer
    const countdownDate = new Date(PRESALE_END_DATE).getTime();
    
    function updateCountdown() {
        const now = new Date().getTime();
        const distance = countdownDate - now;
        
        if (distance < 0) {
            clearInterval(countdownInterval);
            if (document.getElementById("time-remaining")) {
                document.getElementById("time-remaining").textContent = "ENDED";
            }
            return;
        }
        
        const days = Math.floor(distance / (1000 * 60 * 60 * 24));
        const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        const seconds = Math.floor((distance % (1000 * 60)) / 1000);
        
        const timeRemaining = document.getElementById("time-remaining");
        if (timeRemaining) {
            timeRemaining.textContent = `${days}d ${hours}h ${minutes}m ${seconds}s`;
        }
    }
    
    const countdownInterval = setInterval(updateCountdown, 1000);
    updateCountdown();
});
