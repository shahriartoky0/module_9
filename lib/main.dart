import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  double result = 0.0;

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sum App '),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                validator: (String? value) {
                  if (value == null) {
                    return 'This is null';
                  }
                  if (value.trim().isEmpty == true) {
                    return 'Please Give a Number';
                  }
                },
                controller: _fieldOne,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'First Number'),
              ),
              const SizedBox(
                height: 5,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: _fieldTwo,
                validator: (String? value) {
                  if (value == null) {
                    return 'This is null';
                  }
                  if (value.trim().isEmpty == true) {
                    return 'Please Give a Number';
                  }
                },
                decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(),
                    labelText: 'Second Number'),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldOne.text.trim());
                        double secondNumber = double.parse(_fieldTwo.text.trim());
                        result =
                            sum(firstNum: firstNumber, secondNum: secondNumber);
                        _fieldOne.text = result.toString() ;
                        setState(() {});
                      }

                      print('Tenno hokka');
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('Add'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldOne.text.trim());
                        double secondNumber = double.parse(_fieldTwo.text.trim());
                        result =
                            subtract(firstNum: firstNumber, secondNum: secondNumber);
                        setState(() {});
                      }

                      print('Marda fera');
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text('Subtract'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldOne.text.trim());
                        double secondNumber = double.parse(_fieldTwo.text.trim());
                        result =
                            multiplication(firstNum: firstNumber, secondNum: secondNumber);
                        setState(() {});
                      }

                      print('Marda fera');
                    },
                    icon: const Icon(Icons.star_rate),
                    label: const Text('Multiply'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        double firstNumber = double.parse(_fieldOne.text.trim());
                        double secondNumber = double.parse(_fieldTwo.text.trim());
                        result =
                            modulus(firstNum: firstNumber, secondNum: secondNumber);
                        setState(() {});
                      }

                      print('Marda fera');
                    },
                    icon: const Icon(Icons.percent_sharp),
                    label: const Text('Modulus'),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text('The Result is ${result.toStringAsFixed(2)}')
            ],
          ),
        ),
      ),
    );
  }

  double sum({required double firstNum, required double secondNum}) {
    return firstNum + secondNum;
  }

double subtract({required double firstNum, required double secondNum}) {
    return firstNum - secondNum;
  }

  double multiplication({required double firstNum, required double secondNum}) {
    return firstNum * secondNum;
  }
  double modulus({required double firstNum, required double secondNum}) {
    return firstNum % secondNum;
  }

}

