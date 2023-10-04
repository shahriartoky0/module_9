import 'package:flutter/material.dart';
import 'package:module_9/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  double amount = 0;

  double counter = 0;

  final TextEditingController _inputFieldOne = TextEditingController();
  final TextEditingController _inputFieldTwo = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, double> inputs = {'firstNum': 0, 'secondNum': 0};

  storeValue(key, inputValue) {
    inputs.update(key, (value) => inputValue);
  }
  mySnackBar (context , message){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: message ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Practising Form Validation"),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Null Value Inserted';
                      }
                      if (value.trim().isEmpty == true) {
                        return 'Please Insert a value';
                      }
                    },
                    controller: _inputFieldOne,
                    decoration: appTextField('Net Amount'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Null Value Inserted';
                      }
                      if (value.trim().isEmpty == true) {
                        return 'Null Value Inserted';
                      }
                    },
                    controller: _inputFieldTwo,
                    decoration: appTextField('Rate of Interest'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          double principal =
                              double.parse(_inputFieldOne.text.trim());
                          double interest =
                              double.parse(_inputFieldTwo.text.trim());
                          storeValue('firstNum', principal);
                          storeValue('secondNum', interest);

                          amount = (principal * interest) / 100;
                          setState(() {});
                          print(inputs);
                        }
                      },
                      child: const Text('Calculate Interest')),
                  const SizedBox(
                    height: 20,
                  ),
                  Text("Your Interest is ${amount.toStringAsFixed(2)}"),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('           $counter'),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          counter++;
                          if (counter == 5)
                            {
                              mySnackBar(context , 'Pressed 5 times');

                            }
                          setState(() {});
                        },
                        child: const Icon(Icons.add),
                      ),
                      OutlinedButton(
                        onPressed: () {
                          if (counter >0)
                            {
                          counter--;

                            }
                          setState(() {});
                        },
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
