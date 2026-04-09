// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title stETH
 * @dev Simple rebasing-style token representing staked ETH.
 */
contract stETH is ERC20, Ownable {
    constructor() ERC20("Liquid Staked ETH", "stETH") Ownable(msg.sender) {}

    function mint(address _to, uint256 _amount) external onlyOwner {
        _mint(_to, _amount);
    }

    /**
     * @dev In a full implementation, this would handle the rebase 
     * by updating an internal multiplier rather than just minting.
     */
    function handleRewards(uint256 _rewardAmount) external onlyOwner {
        _mint(address(this), _rewardAmount);
    }
}
