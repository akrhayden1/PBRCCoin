// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyMint is ERC20 {
    string private constant tokenName = "PBRC Coin";
    string private constant tokenSymbol = "PBRC";
    uint8 private constant tokenDecimals = 18;
    uint256 private constant maxTokenSupply = 1000000 * (10 ** tokenDecimals);

    constructor() ERC20(tokenName, tokenSymbol) {
        // Token is created, but no initial supply is minted.
    }

    function mint(uint256 amountToMint) public {
        uint256 currentSupply = totalSupply();
        require(
            currentSupply + amountToMint <= maxTokenSupply,
            "Minting the amount requested would exceed the max supply allowed."
        );

        _mint(msg.sender, amountToMint);
    }
}
