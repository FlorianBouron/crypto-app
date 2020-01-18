import 'package:flutter/material.dart';

import '../widgets/crypto_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crypto App'),
      ),
      body: CryptoList(),
    );
  }
}
