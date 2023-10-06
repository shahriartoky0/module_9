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
    return MaterialApp(debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const HomeScreen(),
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
      'size': 'L'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1585045059314-ac5b3e2d263a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1887&q=80',
      'type': 'T-Shirt',
      'color': 'Pink',
      'size': 'M'
    },
    {
      'image':
          'https://images.unsplash.com/photo-1619473792839-1d3b0355a7c8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1964&q=80',
      'type': 'Suit',
      'color': 'Grey',
      'size': 'L'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // responsive smaller device
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 300;


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
      body:
      SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(14, 5, 0, 3),
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
                      if(!isSmallScreen)
                      Expanded(
                          flex: 30,
                          child: Container(
                            // width: 104,
                            height: 104,
                            child: Image.network(
                                shoppingItemsList[index]['image']!),
                          )),
                      Expanded(
                          flex: isSmallScreen ? 100: 70 ,
                          child: Container(

                            child: Card(
                              elevation: 10,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text(
                                      shoppingItemsList[index]['type']!,
                                      style:
                                          TextStyle(fontWeight: FontWeight.w800),
                                    ),
                                    subtitle: RichText(
                                      text: TextSpan(
                                          text: 'Color :',
                                          style: TextStyle(color: Colors.grey),
                                          children: [
                                            TextSpan(
                                                text:
                                                    '${shoppingItemsList[index]['color']!}      ',
                                                style: TextStyle(
                                                    color: Colors.black87),
                                                children: [
                                                  TextSpan(
                                                      text: 'Size :',
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                      children: [
                                                        TextSpan(
                                                            text:
                                                                '${shoppingItemsList[index]['size']!}         ',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black87))
                                                      ]),
                                                ])
                                          ]),
                                    ),
                                    trailing: IconButton(
                                      icon: Icon(Icons.more_vert),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      TextButton(
                                        onPressed: () {},
                                        style: appInputButtonStyle(),
                                        child: const Icon(Icons.remove),
                                      ),
                                      const Text('buy')
                                      ,TextButton(
                                        onPressed: () {},
                                        child: const Icon(Icons.add),
                                        style: appInputButtonStyle(),
                                      ),
                                      const SizedBox(width: 20,),
                                      const Text('total Amount')
                                    ],
                                  )
                                ],
                              ),
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
     bottomNavigationBar:Stack(
       alignment: Alignment.center,
       children: [
       Container(
         margin: const EdgeInsets.all(45),
       // color: Colors.grey, // Background color for the text

       child: const ListTile(
         leading: Text('Total Amount' ,style: TextStyle(color: Colors.grey),),
         trailing: Text('The amount\$'),
       )
     ),
      Positioned(
        bottom: 10,
        child: Container(

          width: 350,
          height: 40,// Width of the button
          // width: double.infinity, // Width of the button
          child: ElevatedButton(
            onPressed: () {
              // Handle button click here
            },
            style: appBottomButtonStyle(),
            child: const Text('Checkout'),
          ),
        ),
      ),]));
  }
}
