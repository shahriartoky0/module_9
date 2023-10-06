import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:module_9/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
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
  List<Map<String, String>> shoppingItemsList = [
    {
      'image':
          'https://images.unsplash.com/photo-1619603364904-c0498317e145?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'type': 'Long-Coat',
      'color': 'Muddy',
      'size': 'L',
      'price': '300',
      'buyingQuantity': '1'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1585045059314-ac5b3e2d263a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'type': 'T-Shirt',
      'color': 'Pink',
      'size': 'M',
      'price': '250',
      'buyingQuantity': '1'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1619473792839-1d3b0355a7c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',
      'type': 'Suit',
      'color': 'Grey',
      'size': 'L',
      'price': '500',
      'buyingQuantity': '1'
    },
  ];
  int grossTotal = 1050;

  @override
  Widget build(BuildContext context) {
    // responsive smaller device
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth <= 360;
    //snackbar code
    mySnackbar(context, message) {
      return ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message),dismissDirection: DismissDirection.vertical,duration: const Duration(seconds: 2),));
    }

    //calculating Total Amount
    int totalAmount(List<Map<String, String>> buyiyngList) {
      int sumTotal = 0;
      for (int i = 0; i < buyiyngList.length; i++) {
        int amount = int.parse(buyiyngList[i]['buyingQuantity']!) *
            int.parse(buyiyngList[i]['price']!);
        sumTotal = sumTotal + amount;
      }
      return sumTotal;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white30,
          elevation: 0,
          actions: const [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
            Text('  ')
          ],
        ),
        body: SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(14, 5, 0, 3),
                child: const Text(
                  'My Bag',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
              ),
              ListView.separated(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: shoppingItemsList.length,
                itemBuilder: (context, index) {
                  return Container(

                    margin: const EdgeInsets.all(5),
                    height: 104,
                    child: Row(
                      children: [
                        // if(!isSmallScreen)
                        isSmallScreen
                            ? Container(

                                // width: 80,
                                height: 104,
                                child: Image.network(
                                    shoppingItemsList[index]['image']!,),
                              )
                            : Expanded(
                                flex: 30,
                                child: SizedBox(
                                  // width: 104,
                                  height: 104,
                                  child: Image.network(
                                      shoppingItemsList[index]['image']!),
                                )),
                        Expanded(
                            flex: isSmallScreen ? 100 : 70,
                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      shoppingItemsList[index]['type']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w800),
                                    ),
                                    subtitle: RichText(
                                      text: TextSpan(
                                          text: 'Color :',
                                          style: const TextStyle(
                                              color: Colors.grey),
                                          children: [
                                            TextSpan(
                                                text:
                                                    '${shoppingItemsList[index]['color']!}      ',
                                                style: const TextStyle(
                                                    color: Colors.black87),
                                                children: [
                                                  TextSpan(
                                                      text: 'Size :',
                                                      style: const TextStyle(
                                                          color: Colors.grey),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '${shoppingItemsList[index]['size']!}         ',
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black87))
                                                      ]),
                                                ])
                                          ]),
                                    ),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.more_vert),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          int unitQuantity = int.parse(
                                              shoppingItemsList[index]
                                                      ['buyingQuantity'] ??
                                                  '1');
                                          shoppingItemsList[index]
                                                  ['buyingQuantity'] =
                                              (unitQuantity - 1).toString();
                                          if (int.parse(
                                                  shoppingItemsList[index]
                                                      ['buyingQuantity']!) ==
                                              0) {
                                            shoppingItemsList[index]
                                                ['buyingQuantity'] = '1';
                                          }
                                          grossTotal =
                                              totalAmount(shoppingItemsList);

                                          setState(() {});
                                        },
                                        style: appInputButtonStyle(),
                                        child: const Icon(Icons.remove),
                                      ),
                                      Text(
                                        '${shoppingItemsList[index]['buyingQuantity']}',
                                        style: TextStyle(
                                            fontSize: isSmallScreen ? 6 : 15),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          int unitQuantity = int.parse(
                                              shoppingItemsList[index]
                                                      ['buyingQuantity'] ??
                                                  '1');
                                          shoppingItemsList[index]
                                                  ['buyingQuantity'] =
                                              (unitQuantity + 1).toString();
                                          grossTotal =
                                              totalAmount(shoppingItemsList);

                                          setState(() {});
                                        },
                                        style: appInputButtonStyle(),
                                        child: const Icon(Icons.add),
                                      ),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Text(
                                        '${shoppingItemsList[index]['price']}\$',
                                        style: TextStyle(
                                            fontSize: isSmallScreen ? 6 : 15,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Stack(alignment: Alignment.center, children: [
          Container(
              margin: const EdgeInsets.all(45),
              // color: Colors.grey, // Background color for the text

              child: ListTile(
                leading: const Text(
                  'Total Amount',
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Text(
                  '$grossTotal \$',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
          Positioned(
            bottom: 10,
            child: SizedBox(
              width: 350,
              height: 40, // Width of the button
              // width: double.infinity, // Width of the button
              child: ElevatedButton(
                onPressed: () {
                  mySnackbar(context, 'Congratulations ! You made it');
                  // Handle button click here
                },
                style: appBottomButtonStyle(),
                child: const Text('Checkout'),
              ),
            ),
          ),
        ]));
  }
}
