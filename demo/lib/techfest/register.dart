import 'package:flutter/material.dart';
import './events.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  TextEditingController nameController = TextEditingController();
  String department = "CE";
  bool tech = false;
  bool nonTech = false;
  String eventName = "Coding Competition";
  double fees = 100;
  DateTime? selectedDate;

  // Date and Time Picker
  Future<void> selectDateTime() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2027),
      initialDate: DateTime.now(),
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        setState(() {
          selectedDate = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TechFest Registration"),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Participant Name
            const Text(
              "Participant Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter your name",
              ),
            ),

            const SizedBox(height: 20),

            // Department
            const Text(
              "Department",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            RadioListTile(
              title: const Text("Computer Engineering"),
              value: "CE",
              groupValue: department,
              onChanged: (value) {
                setState(() {
                  department = value.toString();
                });
              },
            ),

            RadioListTile(
              title: const Text("Information Technology"),
              value: "IT",
              groupValue: department,
              onChanged: (value) {
                setState(() {
                  department = value.toString();
                });
              },
            ),

            const SizedBox(height: 10),

            // Tech / Non-Tech
            const Text(
              "Event Type",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            CheckboxListTile(
              title: const Text("Tech Event"),
              value: tech,
              onChanged: (value) {
                setState(() {
                  tech = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text("Non-Tech Event"),
              value: nonTech,
              onChanged: (value) {
                setState(() {
                  nonTech = value!;
                });
              },
            ),

            const SizedBox(height: 10),

            // Event Name
            const Text(
              "Event Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            DropdownButtonFormField<String>(
              value: eventName,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(
                  value: "Coding Competition",
                  child: Text("Coding Competition"),
                ),
                DropdownMenuItem(
                  value: "Robo Race",
                  child: Text("Robo Race"),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  eventName = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            // Date and Time
            const Text(
              "Event Date & Time",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            ElevatedButton(
              onPressed: selectDateTime,
              child: const Text("Select Date & Time"),
            ),

            if (selectedDate != null)
              Text(
                "Selected: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year} "
                "${selectedDate!.hour}:${selectedDate!.minute}",
              ),

            const SizedBox(height: 20),

            // Fees
            const Text(
              "Fees",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            Slider(
              value: fees,
              min: 0,
              max: 500,
              divisions: 10,
              label: "₹${fees.round()}",
              onChanged: (value) {
                setState(() {
                  fees = value;
                });
              },
            ),

            Center(
              child: Text(
                "Fees: ₹${fees.round()}",
                style: const TextStyle(fontSize: 18),
              ),
            ),

            const SizedBox(height: 25),

            // Register Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please enter participant name"),
                      ),
                    );
                    return;
                  }

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EventsPage(),
                    ),
                  );
                },
                child: const Text("Complete Registration"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}