#Web3 in flutter 
```

  // NB: we're using ropsten test network
  late Client httpClient;
  late wb3.Web3Client web3client;
  ////
  final String privateKey =
      '23c5b7733dcc5d0a02a5fe0f36f6180a8b2b44e933b3cabfbdeb7fd32df2a63f';
  //admin account private key
  final wb3.EthereumAddress contractAddr =
  wb3.EthereumAddress.fromHex('0x387aE552587B477eDe089F4551A2d9a5Be3C2cC8');
  final wb3.EthereumAddress receiver =
  wb3.EthereumAddress.fromHex('0x407e3f77492685E6B34e73F6A0E2BFcD140bDFD7');

  ////
  String url ="https://ropsten.infura.io/v3/4cee14e302a647b6b1986ba43575fb66";
  ////////
  Future <wb3.DeployedContract> loadContract () async {
    String abi =await rootBundle.loadString("assets/abi.json");
    final contract = wb3.DeployedContract(wb3.ContractAbi.fromJson(abi, "RToken"), contractAddr);
    return contract;
  }
  Future <String> send( String functionName,List<dynamic> args) async{
    wb3.EthPrivateKey cerditianls = wb3.EthPrivateKey.fromHex(privateKey);
    wb3.DeployedContract contract = await loadContract();
    final ethFunct = contract.function(functionName);
    final result =await web3client.sendTransaction(cerditianls, wb3.Transaction.callContract(contract: contract, function: ethFunct, parameters: args),chainId: 3);
    return result;
  }

  Future <String> sendTokens() async{
   var amount = BigInt.from(1000000000000000000);
   var response = await send("reward",[receiver,amount]);
    print("transaction done");
    setState(() {
      txHash = response;
    });
    return response;
  }
  ```

