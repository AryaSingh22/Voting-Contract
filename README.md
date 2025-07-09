# 🗳️ Voting Smart Contract

A lightweight and secure on-chain voting system built with Solidity for DAO-style governance.  
This contract enables verified members to create proposals and vote on them. Once a predefined threshold is reached, the proposal is automatically executed.

## 🚀 Features

- ✅ Proposal creation by verified members  
- ✅ Vote casting with automatic change tracking  
- ✅ Execution of target calls when vote threshold is reached  
- ✅ Reentrancy protection with `executed` flag  
- ✅ Event logs for frontend and off-chain tracking  

## 🛠️ Tech Stack

- **Solidity ^0.8.4**  
- Ethereum-compatible EVM chains  
- Works with tools like Hardhat, Foundry, Remix, etc.  

## 🧱 Contract Overview

constructor(address[] memory _members)


- Initializes the contract with a list of member addresses (DAO participants). The deployer is automatically added.

function newProposal(address _target, bytes calldata _data) external


- Allows members to create a new proposal with a target contract and calldata.

function castVote(uint _proposalId, bool _supports) external



- Members can vote Yes or No. Vote changes are supported.
If the number of "Yes" votes reaches the VOTE_THRESHOLD, the proposal executes automatically.

## ⚠️ Security Notes

- Execution is done via low-level .call(), ensure the target contracts are trusted.

- A fixed threshold (VOTE_THRESHOLD = 10) is used; consider making it configurable for production.

- Only verified members can interact with the voting functions.

## 🔧 Deployment
Use your preferred development framework (e.g., Hardhat, Foundry):

# Install dependencies (if using Hardhat)
npm install

# Compile the contract
npx hardhat compile

# Deploy using a script or interact via Remix

## 📄 License
This project is licensed under the MIT License.

## 👤 Author
Made with ❤️ by Arya Singh
Feel free to connect on LinkedIn or explore my other smart contract work on GitHub.

#Solidity #DAO #SmartContracts #Governance #Web3 #Ethereum #BlockchainDeveloper #OpenSource #EVM #CryptoDev #VotingProtocol #dApp #BuildInPublic


