import 'package:flutter/material.dart';
import 'package:module_9/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenUI();
  }
}

class _HomeScreenUI extends State<HomeScreen> {
  List<String> sizes = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  int selectedIndex = -1;

  void _onSizeButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _showSnackbar(sizes[index]);
  }

  void _showSnackbar(String size) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $size'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Size Selector'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: sizes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 5,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () => _onSizeButtonPressed(index),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      selectedIndex == index ? Colors.amber : Colors.grey,
                    ),
                  ),
                  child: Text(
                    sizes[index],
                    style: TextStyle(
                      fontSize: 11,
                      color: selectedIndex == index
                          ? Colors.white
                          : Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
