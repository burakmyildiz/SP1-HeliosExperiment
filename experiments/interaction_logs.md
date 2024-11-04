# Helios Interaction Logs

This document contains logs and observations from interacting with Helios using JSON-RPC methods.

---

## 1. Fetching the Latest Block Number

**Command:**

```bash
curl -X POST -H "Content-Type: application/json" \
--data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}' \
http://localhost:8545 > latestBlockNumber.json
```
**Output:**
```json
{
  "jsonrpc": "2.0",
  "result": "0x14235df",
  "id": 1
}
```
## 2. Fetching the Latest Block Details

**Command:**
```bash
curl -X POST -H "Content-Type: application/json" \
--data '{"jsonrpc":"2.0","method":"eth_getBlockByNumber","params":["latest", false],"id":1}' \
http://localhost:8545 > latestBlockDetails.json
```
**Output:**
```json
{
  "jsonrpc": "2.0",
  "result": {
    "number": "0x14235e1",
    "baseFeePerGas": "0x15d6d01c3",
    "difficulty": "0x0",
    "extraData": "0x6265617665726275696c642e6f7267",
    "gasLimit": "0x1c9c380",
    "gasUsed": "0x9bbb4e",
    "hash": "0x88ecc0ef26ee345062b97d8484e54b94ba49fbf3d279763cfbba08ad8c6f1892",
    "logsBloom": "0x11340e6f...b70a1078e58c20f075ba42...",
    "miner": "0x95222290dd7278aa3ddd389cc1e1d165cc4bafe5",
    "mixHash": "0x077940c8b8e875d7d8f08cc528863f3223cf49e48dfa543499a834022211f389",
    "nonce": "0x0000000000000000",
    "parentHash": "0x92912f43809f663fb65e33b42a78cb92896b0c1fd31d90ce73b0989438d9d7de",
    "receiptsRoot": "0x7237ea43ead0d112382c87b272080362bbfb07fda6d23e882f876622d33fee6f",
    "stateRoot": "0xba9543425c51de89cec2e97ad93822a930b607236ef532d4237b810f1d8355f5",
    "timestamp": "0x672920cf",
    "transactions": ["0xf9b8ce305b9175a3c350cc1f0eec7a4c8451fb14f66dc8ebd99e7202edde1f00", ...],
    "transactionsRoot": "0x752c70f5975b9c01a2ca0db9d7b57732acf0f292f4bbacbc922d3c1a8043aa04",
    "uncles": [],
    "blobGasUsed": "0x0",
    "excessBlobGas": "0x41c0000",
    "parentBeaconBlockRoot": "0x92912f43809f663fb65e33b42a78cb92896b0c1fd31d90ce73b0989438d9d7de"
  },
  "id": 1
}
```
---
## 3. Fetching the Account Balance

**Command:**
```bash
ADDRESS="0xd8dA6BF26964aF9D7eEd9e03E53415D37aA96045"
curl -X POST -H "Content-Type: application/json" \
--data "{\"jsonrpc\":\"2.0\",\"method\":\"eth_getBalance\",\"params\":[\"$ADDRESS\", \"latest\"],\"id\":1}" \
http://localhost:8545 > accountBalance.json
```
**Output:**
```json
{
  "jsonrpc": "2.0",
  "result": "0x2879da78e73640a739",
  "id": 1
}
```