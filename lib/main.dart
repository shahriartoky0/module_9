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
    return  MaterialApp(
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

class _HomeScreenUI extends State<HomeScreen>
{
  // int counter =0 ;
  int totalAmount = 0 ;
  final TextEditingController _glassCounter = TextEditingController();
  // List<DateTime> waterConsumeList =[];
  List<waterTrack> waterConsumeList =[];
  //showing snackbar
  mysnackBar( context ,message)
  {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  // Delete dialog
  myDialog (context ,index)
  {
    return showDialog(context: context, builder: (BuildContext context){
      return Expanded(child: AlertDialog(
        title: Text('Delete' ,style: Theme.of(context).textTheme.bodyLarge,),
        content: const Text('Do You want to Delete ?'),
        actions: [
          TextButton(onPressed: (){
            //delete item code here
            print(index);
            waterConsumeList.removeAt(index);
            Navigator.pop(context);
            mysnackBar(context, 'Item Deleted');
            setState(() {});
            print(waterConsumeList[index].noOfGlass);


          }, child: const Text('Yes')),
          TextButton(onPressed: (){
            // Navigator.pop(context);
            Navigator.of(context).pop();
          }, child: const Text('No')),
        ],
      ));
    });
  }

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
                   SizedBox(width: 90 ,child: TextFormField(
                     controller: _glassCounter,
                     keyboardType: TextInputType.number,
                     decoration: const InputDecoration(enabledBorder: UnderlineInputBorder(),labelText: 'No of Glass'),
                   ),),
                   const SizedBox(width: 10,),
                   ElevatedButton(onPressed: (){
                     // counter++;
                     int noOfGlass = int.tryParse(_glassCounter.text.trim()) ?? 1 ;
                     waterTrack currentData=  waterTrack(DateTime.now(), noOfGlass);
                     totalAmount += noOfGlass;
                     waterConsumeList.add(currentData);
                     mysnackBar(context, 'Drinked $noOfGlass glass of water');
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
           return Card(
             elevation: 5,
             child: ListTile(
               leading: CircleAvatar(child: Text('${index+1}'),),
               title: Text(DateFormat('yy-MM-dd HH:mm').format(waterConsumeList[index].time) ),
               trailing:
               Text(waterConsumeList[index].noOfGlass.toString(),style: Theme.of(context).textTheme.headlineSmall,),
               onLongPress: (){
                 myDialog(context, index);
                 totalAmount= totalAmount- waterConsumeList[index].noOfGlass;
                 if (totalAmount<0)
                   {
                     totalAmount= 0 ;
                   }


               },
             ),
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
