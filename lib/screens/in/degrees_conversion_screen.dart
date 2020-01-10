import 'package:flutter/material.dart';
import 'package:testapp/widgets/user_menu_widget.dart';

class DegreesConversionScreen extends StatefulWidget {
  final String title = 'Degrees Conversion';

  DegreesConversionScreen({Key key}) : super(key: key);
  _DegreesConversionScreen createState() => _DegreesConversionScreen();
}

class _DegreesConversionScreen extends State<DegreesConversionScreen> {
  final celsius = TextEditingController(text: '0');
  final fahrenheit = TextEditingController(text: '32');

  void onChangeCelsius(String value) {
    String nextValue = '';
    double valueToDouble = double.tryParse(value) ?? null;

    if (valueToDouble != null) {
      nextValue = (valueToDouble * 9 / 5 + 32).toString();
    }

    fahrenheit.text = nextValue;
  }

  void onChangeFahrenheit(String value) {
    String nextValue = '';
    double valueToDouble = double.tryParse(value) ?? null;

    if (valueToDouble != null) {
      nextValue = ((valueToDouble - 32) * 5 / 9).toString();
    }

    celsius.text = nextValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextFormField(
              controller: celsius,
              decoration: InputDecoration(labelText: 'Celsius'),
              onChanged: onChangeCelsius,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Padding(padding: const EdgeInsets.all(10.0)),
            TextFormField(
              controller: fahrenheit,
              decoration: InputDecoration(labelText: 'Fahrenheit'),
              onChanged: onChangeFahrenheit,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
          ],
        ),
      ),
    );
  }
}
