import 'package:flutter/material.dart';

class CryptoContainer extends StatelessWidget {
  final currency;
  final MaterialColor color;

  CryptoContainer(this.currency, this.color);

  Widget _getSubtitleText(double price, String percentageChange) {
    TextSpan priceTextWidget = TextSpan(
      text: "\$${price.toStringAsFixed(2)}\n",
      style: TextStyle(
        color: Colors.black,
      ),
    );
    final String percentageChangeText = '1 hour: $percentageChange%';
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentageChange) > 0) {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(
          color: Colors.green,
        ),
      );
    } else {
      percentageChangeTextWidget = TextSpan(
        text: percentageChangeText,
        style: TextStyle(
          color: Colors.red,
        ),
      );
    }

    return RichText(
      text: TextSpan(
        children: [
          priceTextWidget,
          percentageChangeTextWidget,
        ],
      ),
    );
  }

  @override
  ListTile build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color,
        child: Text(
          currency['name'][0],
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      title: Text(
        '${currency['name']} - ${currency['symbol']}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: _getSubtitleText(
        double.parse(currency['price_usd']),
        currency['percent_change_1h'],
      ),
    );
  }
}
