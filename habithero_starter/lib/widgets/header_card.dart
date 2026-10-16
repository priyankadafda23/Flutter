import 'package:flutter/material.dart';

/// Greeting card at the top of the home screen.
class HeaderCard extends StatelessWidget {
  const HeaderCard({super.key});

  // >>> Q6A5 START
  Widget _flame() {
    return const Icon(
      Icons.local_fire_department,
      size: 44,
      color: Colors.orange,
    );
  }
  // <<< Q6A5 END

  @override
  Widget build(BuildContext context) {
    // >>> Q3 START
    return Container(
      width: MediaQuery.of(context).size.width*0.9,
      margin:EdgeInsets.all(16),
      padding:EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient:LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [Color(0x7E57C2),Color(0x3F51B5)]
          ),
          boxShadow: [BoxShadow(color: Colors.black12)]

        ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            _flame(),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Good Morning, Hero!',
                  style: TextStyle(
                    color: Colors.white, 
                    fontWeight: FontWeight.bold
                    ),
                ),
                const Text('Keep your streak alive!',
                  style: TextStyle(
                    color: Colors.white70,
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
    // <<< Q3 END
  }
}