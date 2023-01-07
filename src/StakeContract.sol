// SPDX-License-Identifier: UNLICENSED
pragma solidity <=0.8.13;

// import "./IERC20.sol";

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract StakeContract {
    mapping(address => uint256) public s_balances;

    function stake(uint256 _amount, address _token) external returns (bool) {
        s_balances[msg.sender] = s_balances[msg.sender] + _amount;
        bool success = IERC20(_token).transferFrom(
            msg.sender,
            address(this),
            _amount
        );
        if (!success) revert("Trasnfer Failed");
        return success;
    }
}
// https://youtu.be/pgh74-XulXg?t=923
