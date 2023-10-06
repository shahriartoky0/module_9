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

class _HomeScreenUI extends State<HomeScreen>
{
  // int counter =0 ;
  int totalAmount = 0 ;
  final TextEditingController _glassCounter = TextEditingController();
  // List<DateTime> waterConsumeList =[];
  List<waterTrack> waterConsumeList =[];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(title: const Text('Water Consume Tracker'),centerTitle: true,),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.start ,
       children: [

         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Column(
             children: [
               Text('Total Consume', style: Theme.of(context).textTheme.titleLarge,),
               Text('$totalAmount', style: Theme.of(context).textTheme.headlineLarge,),

               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(width: 40 ,child: TextFormField(
                     controller: _glassCounter,
                     decoration: const InputDecoration(enabledBorder: UnderlineInputBorder()),
                   ),),
                   const SizedBox(width: 10,),
                   ElevatedButton(onPressed: (){
                     // counter++;
                     int noOfGlass = int.tryParse(_glassCounter.text) ?? 1 ;
                     waterTrack currentData=  waterTrack(DateTime.now(), noOfGlass);
                     totalAmount += noOfGlass;
                     waterConsumeList.add(currentData);
                     _glassCounter.text = '1';
                     // print(currentData.noOfGlass);

                     setState(() {});
                   }, child: const Text('Add')),
                 ],
               ),
             ],
           ),
         ),
         Expanded(child: ListView.builder(itemCount: waterConsumeList.length,itemBuilder: (context , index){
           return ListTile(
             leading: CircleAvatar(child: Text('${index+1}'),),
             title: Text(DateFormat('yy-MM-dd HH:mm').format(waterConsumeList[index].time) ),
             trailing: Text(waterConsumeList[index].noOfGlass.toString(),style: Theme.of(context).textTheme.headlineSmall,),


           );
         }))
       ],
     ),

   );
  }
}
class waterTrack {
  final DateTime time ;
  final int noOfGlass ;
  waterTrack(this.time, this.noOfGlass);
}
