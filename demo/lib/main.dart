import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white,
              fontFamily: 'Roboto',
            ),
          ),  
          backgroundColor: const Color.fromARGB(255, 0, 27, 50),
          leading: const Icon(Icons.menu),
        ),
        body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 200,
                  color: const Color.fromARGB(255, 0, 140, 255),
                  child: ElevatedButton(
                    onPressed: (){
                      print('Button Pressed');
                    }, 
                    child: const Text('Click Me',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  color: const Color.fromARGB(255, 240, 60, 50),
                  child: const Center(
                    child: Text('Welcome to Flutter😁',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200,
                  color: const Color.fromARGB(255, 252, 59, 255),
                  child: const Center(
                    child: Text('Enjoy your Flutter journey! 😊',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
