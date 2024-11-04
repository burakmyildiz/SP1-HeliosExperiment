#!/bin/bash

# Description: Script to interact with Helios and perform JSON-RPC requests
# Usage: Run this script to execute a series of commands and interact with Helios

# Define the Ethereum address to use
ADDRESS="0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"

# 1. Get the latest block number
echo "Fetching the latest block number..."
curl -X POST -H "Content-Type: application/json" \
	--data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
	http://localhost:8545 >latestBlockNumber.json
echo "Saved the latest block number to latestBlockNumber.json"

# 2. Get details of the latest block
echo "Fetching the latest block details..."
curl -X POST -H "Content-Type: application/json" \
	--data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", false],"id":1}' \
	http://localhost:8545 >latestBlockDetails.json
echo "Saved the latest block details to latestBlockDetails.json"

# 3. Get the account balance for the specified address
echo "Fetching the account balance for $ADDRESS..."
curl -X POST -H "Content-Type: application/json" \
	--data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"$ADDRESS\", \"latest\"],\"id\":1}" \
	http://localhost:8545 >accountBalance.json
echo "Saved the account balance to accountBalance.json"

# 4. Attempt to get proof for the specified address
echo "Attempting to get proof for $ADDRESS..."
http://localhost:8545 >accountProof.json
ALCHEMY_URL="https://eth-mainnet.alchemyapi.io/v2/myAPIKey"
curl -X POST -H "Content-Type: application/json" --data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getProof\",\"params\":[\"$ADDRESS\", [], \"latest\"],\"id\":1}" $ALCHEMY_URL >AccountProof.json
echo "Saved the account proof (if available) to accountProof.json"

echo "Script execution complete. Check the generated JSON files for outputs."
