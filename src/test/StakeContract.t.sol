// SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.8.13;

import "../StakeContract.sol";
import "forge-std/Test.sol";
import "../mocks/MockERC20.sol";

contract StakeContractTest is Test {


    StakeContract public stakeContract;
    MockERC20 public tokenContract;
    uint256 public constant AMOUNT = 1e18;

    function setUp() public {
        stakeContract = new StakeContract();
        tokenContract = new MockERC20();
        
    }

    // tokens can be sent to staking contract

    function testStakingToken() public {
        tokenContract.approve(address(stakeContract), AMOUNT);
        bool success = stakeContract.stake(AMOUNT,address(tokenContract));
        assertTrue(success);
    }
}
