// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

contract StakingContract {
    uint256 public totalStakes;
    mapping(address => uint) stakes;
    

    function stake(uint _amount) public payable {
        require(_amount > 0);
        require(_amount == msg.value);
        stakes[msg.sender] += _amount;
        totalStakes += _amount;
    }

    function unstake(uint _amount) public {
        require(stakes[msg.sender] >= _amount);
        payable(msg.sender).transfer(_amount / 2);
        totalStakes -= _amount;
        stakes[msg.sender] -= _amount;
    }
}   
