# Liquid Staking Derivative (Lido-style)

A professional-grade implementation for capital-efficient staking. This repository solves the "Locked Liquidity" problem of native staking. Usually, staking ETH requires locking it in the Beacon Chain, making it unusable for DeFi. This protocol issues a rebasing token (stETH) that represents the user's staked principal plus accumulated rewards, which can be traded or used as collateral.

## Core Features
* **stETH Minting:** 1:1 minting of receipt tokens upon ETH deposit.
* **Oracle-Based Rebase:** Logic to update total supply based on the rewards earned by the underlying validator set.
* **Validator Registry:** Manages a curated list of Node Operators to minimize slashing risk.
* **Flat Architecture:** Single-directory layout for the Staking Pool, stETH Token, and Oracle interface.

## Logic Flow
1. **Stake:** User deposits 10 ETH into the Staking Pool.
2. **Mint:** The pool mints 10 stETH and sends it to the user.
3. **Validate:** The pool aggregates ETH and deposits it into the Ethereum Deposit Contract in 32 ETH chunks.
4. **Rebase:** The Oracle reports 1 ETH in rewards. The total supply of stETH increases proportionally for all holders.

## Setup
1. `npm install`
2. Deploy `StakingPool.sol` and `stETH.sol`.
