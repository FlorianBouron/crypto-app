import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import './crypto_container.dart';

class CryptoList extends StatefulWidget {
  @override
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];

  @override
  void initState() {
    super.initState();
    _getCurrencies();
  }

  Future<void> _getCurrencies() async {
    final String url = 'https://api.coinmarketcap.com/v1/ticker/?limit=50';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        currencies = json.decode(response.body);
      });
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: currencies.length > 0
          ? ListView.builder(
              itemCount: currencies.length,
              itemBuilder: (BuildContext context, int index) {
                final MaterialColor color = _colors[index % _colors.length];
                return CryptoContainer(currencies[index], color);
              },
            )
          : Text('Loading'),
    );
  }
}
