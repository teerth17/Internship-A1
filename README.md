# Internship-A1
deployed at : 0xB289760720eEfb02d17653b8C3171E7183304AE9.

Etherscan link: [click here](https://sepolia.etherscan.io/address/0xB289760720eEfb02d17653b8C3171E7183304AE9#code)

This is a sample project for demonstrating how to swap ETH for ERC20 tokens on Uniswap using Solidity smart contracts.

## Contract Details

### Contract Name

The contract is named swapEther.

### Functionality

The swapEtherToToken function in the contract allows a user to swap ETH for any ERC20 token listed on Uniswap.

### Parameters

The swapEtherToToken function takes the following parameters:

- `token` (`address`): The address of the ERC20 token to swap
- `minAmount` (`uint`): The minimum amount of tokens to receive

### Return Value

The swapEtherToToken function returns the amount of tokens received in the swap as a `uint`.

## Libraries Used

The following libraries were used in this project:

- `@uniswap/v2-periphery`: Provides an interface for interacting with the Uniswap V2 decentralized exchange.
- `@openzeppelin/contracts`: Provides a collection of secure and audited smart contracts that can be used in Ethereum projects.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
