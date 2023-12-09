import 'package:flutter/material.dart';
import 'scientific.dart';
import 'beranda.dart';

class BinaryConverter extends StatefulWidget {
  @override
  _BinaryConverterState createState() => _BinaryConverterState();
}

class _BinaryConverterState extends State<BinaryConverter> {
  TextEditingController _inputController = TextEditingController();
  String _result = '';
  String _selectedConversion = 'Text to Binary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Binary Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(labelText: 'Enter Text or Number'),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedConversion,
              onChanged: (String? value) {
                setState(() {
                  _selectedConversion = value!;
                });
              },
              items: <String>['Text to Binary', 'Binary to Text', 'Binary to Decimal', 'Hex to Decimal']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                convert();
              },
              child: Text('Convert'),
            ),
            SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                clearInput();
              },
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }

  void convert() {
    String input = _inputController.text;

    if (_selectedConversion == 'Text to Binary') {
      if (int.tryParse(input) != null) {
        // If input is a number, convert it to binary
        int decimalValue = int.parse(input);
        _result = 'Binary: ${decimalValue.toRadixString(2)}';
      } else {
        // If input is text, convert each character to binary
        List<int> asciiValues = input.codeUnits;
        List<String> binaryValues = [];

        for (int asciiValue in asciiValues) {
          String binary = asciiValue.toRadixString(2);
          binaryValues.add(binary.padLeft(8, '0'));
        }

        _result = 'Binary: ${binaryValues.join(' ')}';
      }
    } else if (_selectedConversion == 'Binary to Text') {
      // If input is binary, convert it to text
      List<String> binaryList = input.split(' ');
      List<int> asciiValues = [];

      for (String binary in binaryList) {
        int decimalValue = int.parse(binary, radix: 2);
        asciiValues.add(decimalValue);
      }

      _result = 'Text: ${String.fromCharCodes(asciiValues)}';
    } else if (_selectedConversion == 'Binary to Decimal') {
      // If input is binary, convert it to decimal
      int decimalValue = int.parse(input, radix: 2);
      _result = 'Decimal: $decimalValue';
    } else if (_selectedConversion == 'Hex to Decimal') {
      // If input is hex, convert it to decimal
      int decimalValue = int.parse(input, radix: 16);
      _result = 'Decimal: $decimalValue';
    }

    setState(() {});
  }

  void clearInput() {
    _inputController.clear();
    _result = '';
    setState(() {});
  }
}