// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Contract.sol";

contract TestContract is Test {
    StakingContract c;

    function setUp() public {
        c = new StakingContract();
    }

    function test_stake() public  {
        uint value = 10 ether;
        c.stake{value: value}(value);

        assert(c.totalStakes() == value);
    }   

    function testfailStake() public {
        uint value = 10 ether;
        c.stake(value);
        assert(c.totalStakes() == value);
    }

    function test_unstake() public {
        uint value = 10 ether;
        vm.startPrank(0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc);
        vm.deal(0x406AB5033423Dcb6391Ac9eEEad73294FA82Cfbc, value);
        c.stake{value: value}(value);
        c.unstake(value);

        assert(c.totalStakes() == 0);
    }
}