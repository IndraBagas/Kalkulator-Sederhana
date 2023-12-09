import 'package:flutter/material.dart';
import 'dart:math';
import 'beranda.dart';


class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  double _sin(double value) => sin(value * (pi / 180));
  double _cos(double value) => cos(value * (pi / 180));
  double _tan(double value) => tan(value * (pi / 180));
  double _log(double value) => log(value);

  _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _output = "0";
        _input = "";
        _num1 = 0;
        _num2 = 0;
        _operator = "";
      } else if (value == "+" ||
          value == "-" ||
          value == "x" ||
          value == "/" ||
          value == "^2" ||
          value == "√" ||
          value == "sin" ||
          value == "cos" ||
          value == "tan" ||
          value == "log") {
        if (_output != "0" && _output != "Error") {
          _num1 = double.parse(_output);
        }
        _operator = value;
        _input += value;
        _output = "0";
      } else if (value == "=") {
        _num2 = double.parse(_output);
        if (_operator == "+") {
          _output = (_num1 + _num2).toString();
        } else if (_operator == "-") {
          _output = (_num1 - _num2).toString();
        } else if (_operator == "x") {
          _output = (_num1 * _num2).toString();
        } else if (_operator == "/") {
          if (_num2 != 0) {
            _output = (_num1 / _num2).toString();
          } else {
            _output = "Error";
          }
        } else if (_operator == "^2") {
          _output = pow(_num1, 2).toString();
        } else if (_operator == "√") {
          _output = sqrt(_num1).toString();
        } else if (_operator == "sin") {
          _output = _sin(_num1).toString();
        } else if (_operator == "cos") {
          _output = _cos(_num1).toString();
        } else if (_operator == "tan") {
          _output = _tan(_num1).toString();
        } else if (_operator == "log") {
          _output = _log(_num1).toString();
        }
        _operator = "";
        _input = "";
        _num1 = 0;
        _num2 = 0;
      } else if (value == "<") {
        // Hapus satu karakter
        if (_input.isNotEmpty) {
          _input = _input.substring(0, _input.length - 1);
          _output = _input.isNotEmpty ? _input : "0";
        }
      } else {
        if (_output == "0" || _output == "Error") {
          _output = value;
        } else {
          _output += value;
        }
        _input += value;
      }
    });
  }

  Widget buildButton(String text) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
        ),
        onPressed: () => _onPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  Widget buildFunctionButton(String text) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          primary: Color.fromARGB(255, 103, 103, 103),
        ),
        onPressed: () => _onPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }

  Widget buildActionButton(String text, {Color? color, Color? textColor}) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          primary: color ?? const Color.fromARGB(255, 4, 255, 0),
        ),
        onPressed: () => _onPressed(text),
        child: Text(
          text,
          style: TextStyle(fontSize: 24.0, color: textColor ?? Colors.white),
        ),
      ),
    );
  }

  Widget buildBackspaceButton() {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(24.0),
          primary: const Color.fromARGB(255, 255, 0, 0),
        ),
        onPressed: () => _onPressed("<"),
        child: Icon(Icons.backspace, size: 24.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.calculate),
            SizedBox(width: 8.0),
            Text("Calculator"),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
            alignment: Alignment.bottomRight,
            child: Text(
              _input,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            alignment: Alignment.bottomRight,
            child: Text(
              _output,
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: <Widget>[
              buildActionButton("C", color: Colors.red),
              buildFunctionButton("sin"),
              buildFunctionButton("cos"),
              buildFunctionButton("tan"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildActionButton("/"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildActionButton("x"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildActionButton("-"),
            ],
          ),
          Row(
            children: <Widget>[
              buildButton("0"),
              buildBackspaceButton(),
              buildActionButton("="),
              buildActionButton("+"),
            ],
          ),
          Row(
            children: <Widget>[
              buildFunctionButton("^2"),
              buildFunctionButton("√"),
            ],
          ),
        ],
      ),
    );
  }
}