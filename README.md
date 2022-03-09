Setup
- npm install
- add .env file, see below
- compile contract
- deploy contract to testnet
- verify and publish contract

Tests
- npx hardhat compile
- npx hardhat test

Pre-Deployment checks
- Node provider api url
- Etherscan/Polygonscan api key for verification
- Signer private key. eg: your metamask private key

Deployment flow
- npx hardhat compile
- npx hardhat run scripts/<deployment script> --network <your network>
- mumbai
    - npx hardhat run scripts/deploy.js --network polygon_mumbai
        - first deployment = 0x97692ab2db6a778a20e16674f464e4863044c4c0
        - second deployment = 0xd67b2cd77a4b49773d0a2443c08ab93e9c0b718d
            - This was the incorrect address provided by deploy.js = 0x117814AF22Cb83D8Ad6e8489e9477d28265bc105 (no idea why)
        - third deployment (ChumbiClone): incorrect address at 0xdAfe19f72c63933A1cC501B3009149e963E97A81,
            - real address at 0xdafe19f72c63933a1cc501b3009149e963e97a81
        - fourth deployment (MissionDAO): 0xCBF12b10c76893DD9fc418AcB07ca0f4D3e6eDC4
        - fifth deployment (production): 0x987C70245378091041Cd4dd2C99b8d393292fdc5

Create .env file
- include your API KEY for which ever node provider you are using
    - ensure you have 1 variable for the API_URL and one for the API_KEY for the service provider
- include your wallet private key
    - private key for signing transactions
- include polygonscan api key to verify and publish contract after deployment
- Relevant packages: dotenv

Interacting with your contract
- npx hardhat run scripts/interact.js
- You need 3 things to interact with your smart contract
    1. Your node provider api_key
    2. Your wallet
    3. Your contract abi which will be used to retrieve your contract
- Relevant packages: ethers

Retrieving your contract address
- for some reason, the contract address being printed during deploy.js is not accurate.
- retrieving it using eth_getTransactionReceipt.contractAddress is the correct address. You can
- find this one your node provider.

Verifying Contract on Etherscan/Polygonscan
- npx hardhat verify --network polygon_mumbai 0xCBF12b10c76893DD9fc418AcB07ca0f4D3e6eDC4 <constructor arguments>
- Relevant packages: hardhat-etherscan