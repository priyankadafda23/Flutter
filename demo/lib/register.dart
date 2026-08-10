import 'package:flutter/material.dart';

class RegisterExercise extends StatefulWidget {
  @override
  State<RegisterExercise> createState() => _RegisterExerciseState();
}

class _RegisterExerciseState extends State<RegisterExercise> {

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();

  // Branch
  bool it = false;

  // Gender
  String gender = "";

  // Division
  String division = "A";

  // Programming efficiency
  double efficiency = 1;

  // Languages
  bool hindi = false;
  bool english = false;
  bool gujarati = false;

  // Show submitted data
  bool showData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student Registration"),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Student Name
            Text(
              "Student Name",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 5),

            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: "Enter student name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Branch
            Text(
              "Branch",
              style: TextStyle(fontSize: 16),
            ),

            Row(
              children: [

                Text("CE"),

                Checkbox(
                  value: !it,
                  onChanged: (value) {
                    setState(() {
                      it = false;
                    });
                  },
                ),

                Text("IT"),

                Checkbox(
                  value: it,
                  onChanged: (value) {
                    setState(() {
                      it = true;
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10),

            // Gender
            Text(
              "Gender",
              style: TextStyle(fontSize: 16),
            ),

            Row(
              children: [

                Text("Male"),

                Radio(
                  value: "Male",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),

                Text("Female"),

                Radio(
                  value: "Female",
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                    });
                  },
                ),
              ],
            ),

            SizedBox(height: 10),

            // Division
            Text(
              "Division",
              style: TextStyle(fontSize: 16),
            ),

            DropdownButton(
              value: division,

              items: ["A", "B", "C", "D", "E", "F", "G"]
                  .map(
                    (value) => DropdownMenuItem(
                      value: value,
                      child: Text(value),
                    ),
                  )
                  .toList(),

              onChanged: (value) {
                setState(() {
                  division = value.toString();
                });
              },
            ),

            SizedBox(height: 10),

            // Age
            Text(
              "Age",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 5),

            TextField(
              controller: age,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "Enter age",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Email
            Text(
              "Email",
              style: TextStyle(fontSize: 16),
            ),

            SizedBox(height: 5),

            TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Enter email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            // Programming Efficiency
            Text(
              "Programming Languages Efficiency",
              style: TextStyle(fontSize: 16),
            ),

            Slider(
              min: 1,
              max: 15,
              divisions: 14,
              value: efficiency,

              onChanged: (value) {
                setState(() {
                  efficiency = value;
                });
              },
            ),

            Center(
              child: Text(
                "Level: ${efficiency.toInt()}",
              ),
            ),

            SizedBox(height: 20),

            // Languages Known
            Text(
              "Languages Known",
              style: TextStyle(fontSize: 16),
            ),

            CheckboxListTile(
              title: Text("Hindi"),
              value: hindi,
              onChanged: (value) {
                setState(() {
                  hindi = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text("English"),
              value: english,
              onChanged: (value) {
                setState(() {
                  english = value!;
                });
              },
            ),

            CheckboxListTile(
              title: Text("Gujarati"),
              value: gujarati,
              onChanged: (value) {
                setState(() {
                  gujarati = value!;
                });
              },
            ),

            SizedBox(height: 10),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showData = true;
                  });
                },

                child: Text("Submit"),
              ),
            ),

            SizedBox(height: 20),

            // Display Data
            if (showData)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Submitted Details",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 10),

                  Text("Student Name: ${name.text}"),

                  Text(
                    "Branch: ${it ? "IT" : "CE"}",
                  ),

                  Text("Gender: $gender"),

                  Text("Division: $division"),

                  Text("Age: ${age.text}"),

                  Text("Email: ${email.text}"),

                  Text(
                    "Programming Efficiency: "
                    "${efficiency.toInt()} / 15",
                  ),

                  Text(
                    "Languages Known: "
                    "${hindi ? "Hindi " : ""}"
                    "${english ? "English " : ""}"
                    "${gujarati ? "Gujarati" : ""}",
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}