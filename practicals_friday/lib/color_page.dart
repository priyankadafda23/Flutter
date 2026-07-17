import 'package:flutter/material.dart';

class ColorPage extends StatefulWidget {
  ColorPage({super.key});
  @override
  State<ColorPage> createState() => _ColorPageState();
}

class _ColorPageState extends State<ColorPage> {
  var colors = [Colors.yellow, Colors.green, Colors.red, Colors.blue];
  var count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Color Page'),
      ),
      body: Column(
        children:[
          Expanded(child: Container(color: colors[(0+count)%4])),
          Expanded(child: Container(color: colors[(1+count)%4])),
          Expanded(child: Container(color: colors[(2+count)%4])),
          Expanded(child: Container(color: colors[(3+count)%4])),
          ElevatedButton(
            onPressed:(){
              count++;
              setState(() {});
              print("Button pressed $count times");
            }, 
            child: const Text('Press Me')
          ),
        ]
      ),
    );
  }
}