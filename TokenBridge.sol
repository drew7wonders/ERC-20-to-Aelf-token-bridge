pragma solidity ^0.6.0;

contract TokenBridge {
    // Mapping to track the cross-chain transfer of ERC-20 tokens
    mapping (bytes32 => uint) public tokenBalances;

    // Address of the ERC-20 contract on the EVM chain
    address public erc20Contract;

    // Address of the aelf chain
    address public aelfChain;

    // Initiate a cross-chain transfer of tokens
    function transfer(bytes32 _tokenId, uint _value) external {
        require(_value > 0, "Invalid transfer amount");
        require(tokenBalances[_tokenId] >= _value, "Insufficient balance");

        // Transfer tokens from the ERC-20 contract on the EVM chain to the aelf chain
        erc20Contract.transfer(_value);
        aelfChain.transfer(_value);

        // Update the token balance on the token bridge
        tokenBalances[_tokenId] -= _value;
    }
}
