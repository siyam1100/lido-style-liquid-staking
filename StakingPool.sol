// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./stETH.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

/**
 * @title StakingPool
 * @dev Collects user ETH and manages the issuance of stETH.
 */
contract StakingPool is ReentrancyGuard {
    stETH public immutable stETHToken;
    uint256 public totalPooledETH;

    event Staked(address indexed user, uint256 amount);

    constructor(address _stETH) {
        stETHToken = stETH(_stETH);
    }

    /**
     * @dev User deposits ETH to receive stETH.
     */
    function stake() external payable nonReentrant {
        require(msg.value > 0, "Cannot stake 0");
        
        totalPooledETH += msg.value;
        stETHToken.mint(msg.sender, msg.value);
        
        emit Staked(msg.sender, msg.value);
    }

    /**
     * @dev In a production environment, this would call the 
     * Ethereum 2.0 Deposit Contract once 32 ETH is reached.
     */
}
