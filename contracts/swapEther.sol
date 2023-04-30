// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@uniswap/v2-periphery/contracts/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// 0xB26B2De65D07eBB5E54C7F6282424D3be670E1f0

interface ERC20Swapper {
    /// @dev swaps the `msg.value` Ether to at least `minAmount` of tokens in `token`, or reverts
    /// @param token The address of the ERC-20 token to swap
    /// @param minAmount The minimum amount of tokens to receive
    /// @return The actual amount of transferred tokens
    function swapEtherToToken(address token, uint minAmount) external payable returns (uint);
}

contract swapEther is ERC20Swapper {
    // address of the Uniswap V2 Router contract on the Ethereum mainnet
    address private constant UNISWAP_ROUTER_ADDRESS = 0xB26B2De65D07eBB5E54C7F6282424D3be670E1f0;
    IUniswapV2Router02 private uniswapRouter = IUniswapV2Router02(UNISWAP_ROUTER_ADDRESS);

    function swapEtherToToken(
        address token,
        uint minAmount
    ) external payable override returns (uint) {
        // make sure the token is not ETH
        require(token != address(0), "Invalid token address");

        // create the swap path for Uniswap V2
        address[] memory path = new address[](2);
        path[0] = uniswapRouter.WETH();
        path[1] = token;

        // approve the token for the router
        IERC20(token).approve(UNISWAP_ROUTER_ADDRESS, type(uint).max);

        // convert the minimum amount to receive to Wei
        uint minAmountInWei = minAmount * 10 ** 18;

        // perform the swap
        uint[] memory amounts = uniswapRouter.swapExactETHForTokens{value: msg.value}(
            minAmountInWei,
            path,
            msg.sender,
            block.timestamp + 3600
        );

        return (amounts[1]);
    }
}
