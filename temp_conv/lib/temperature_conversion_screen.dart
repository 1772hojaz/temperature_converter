import 'package:flutter/material.dart';
import 'history_list.dart';

class TemperatureConversionScreen extends StatefulWidget {
  @override
  _TemperatureConversionScreenState createState() =>
      _TemperatureConversionScreenState();
}

class _TemperatureConversionScreenState
    extends State<TemperatureConversionScreen> {
  final _formKey = GlobalKey<FormState>();
  double _temperatureValue = 0;
  bool _isFahrenheitToCelsius = true;
  final List<Map<String, String>> historyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Temperature Value'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
                onSaved: (value) {
                  if (value != null) {
                    _temperatureValue = double.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
              ),
              ListTile(
                title: Text(_isFahrenheitToCelsius
                    ? 'Fahrenheit to Celsius'
                    : 'Celsius to Fahrenheit'),
                trailing: Switch(
                  value: _isFahrenheitToCelsius,
                  onChanged: (value) {
                    setState(() {
                      _isFahrenheitToCelsius = value;
                    });
                  },
                ),
              ),
              ElevatedButton(
                child: Text('Convert'),
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    double convertedValue =
                        _temperatureConversion(_temperatureValue);
                    historyList.add({
                      'conversion':
                          _isFahrenheitToCelsius ? 'F to C' : 'C to F',
                      'value': _temperatureValue.toString(),
                      'result': convertedValue.toStringAsFixed(2),
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Converted: ${convertedValue.toStringAsFixed(2)}'),
                      ),
                    );

                    setState(() {}); // Update the UI to show the history list
                  }
                },
              ),
              Expanded(
                child: HistoryList(history: historyList),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double _temperatureConversion(double temperature) {
    return _isFahrenheitToCelsius
        ? (temperature - 32) * 5 / 9 // F to C
        : temperature * 9 / 5 + 32; // C to F
  }
}
