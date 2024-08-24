import 'package:flutter/material.dart';

class grid extends StatefulWidget {
  const grid({super.key});

  @override
  State<grid> createState() => grid_state();
}

// ignore: camel_case_types
class grid_state extends State<grid> {
  @override
  Widget build(BuildContext context) {
    var arrcolors = [
      Colors.pinkAccent,
      Colors.red,
      Colors.blueAccent,
      Colors.brown,
      Colors.green,
    ];
    return Scaffold(
      appBar: AppBar(),
      body:
        GridView.builder(itemBuilder: (context,index)
        { return Container(color:arrcolors[index],);
        },itemCount:arrcolors.length,gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3) ,)
          // GridView.count(
          //   crossAxisCount: 5,
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(color: arrcolors[0]),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(color: arrcolors[1]),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(color: arrcolors[2]),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(color: arrcolors[3]),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(color: arrcolors[4]),
          //     ),
          //   ],
          // ),




    );
  }
}


// Container(child: GridView.extent(maxCrossAxisExtent: 60,
// children: [ Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrcolors[0]),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color:arrcolors[1] ),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrcolors[2]),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrcolors[3]),
// ),
// Padding(
// padding: const EdgeInsets.all(8.0),
// child: Container(color: arrcolors[4]),
// ),
//
// ],)
// )