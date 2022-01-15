import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:http/http.dart';
import 'package:story/componants/button.componant.dart';
import 'package:story/componants/items.dart';
import 'package:story/domain/controllers/data.dao.dart';
import 'package:story/domain/models/data.dart';
import 'package:web3dart/web3dart.dart' as wb3 ;


class QRScanPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpClient=Client();
    web3client=wb3.Web3Client(url, httpClient);
  }

  ////
  String qrCode = 'Unknown';
  String result = '';
  String txHash="";
  List <dynamic> hashes= [];
  ////
  late Client httpClient;
  late wb3.Web3Client web3client;
  ////
  final String privateKey =
      '23c5b7733dcc5d0a02a5fe0f36f6180a8b2b44e933b3cabfbdeb7fd32df2a63f';
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
  Future<List<dynamic>> query(String functionName,List<dynamic> args) async {
    final contract = await loadContract();
    final ethFunct = contract.function(functionName);
    final result = await web3client.call(contract: contract, function: ethFunct, params: args);
    return result;
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
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('data').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        hashes =snapshot.data!.docs.map((document) {
          return document['hash'];
        }).toList();
        print(hashes);
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '$result',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 72),
              ButtonWidget(
                text: 'Start QR scan',
                onClicked: () {
                  scanQRCode();
                },
              ),
              const SizedBox(height: 25),

              ButtonWidget(
                text: 'Submit Transaction',
                onClicked: () {
                  if (hashes.contains(qrCode)){
                    sendTokens();
                    setState(() {
                      result="You will receive your tokens soon enough\n txhash="+txHash;
                      print( result);
                    });
                  }
                  else {
                    result="transaction denied";
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        ScanMode.QR,
      );

      if (!mounted) return;

      setState(() {
        this.qrCode = qrCode;
      });
    } on PlatformException {
      qrCode = 'Failed to get platform version.';
    }
  }
}