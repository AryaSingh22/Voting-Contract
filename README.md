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

```solidity
constructor(address[] memory _members)
