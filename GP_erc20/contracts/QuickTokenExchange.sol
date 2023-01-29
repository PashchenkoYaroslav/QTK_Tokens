// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract QuickTokenExchange is ERC20 {
    string public info;

    constructor(string memory _info) ERC20("QuickTokenExchange", "QTKX") {
         info = _info;
    }

    function getInfo() public view returns (string memory) {
        return info;
    }
}
