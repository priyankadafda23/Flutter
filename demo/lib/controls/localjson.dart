import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final nameCtrl = TextEditingController();
  String gender = "Male";
  bool agree = false;

  List<Map<String, dynamic>> items = [];

  static const String _key = "entries";

  // Added for edit
  int? editingIndex;

  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    super.dispose();
  }

  Future<void> _load() async {
    final pref = await SharedPreferences.getInstance();
    final raw = pref.getString(_key);

    if (raw == null) return;

    final list = jsonDecode(raw) as List;

    setState(() {
      items = list.map<Map<String, dynamic>>((item) {
        return Map<String, dynamic>.from(item);
      }).toList();
    });
  }

  Future<void> _save() async {
    if (nameCtrl.text.trim().isEmpty) return;

    items.add({
      'name': nameCtrl.text,
      'gender': gender,
      'agree': agree,
    });

    final pref = await SharedPreferences.getInstance();

    await pref.setString(
      _key,
      jsonEncode(items),
    );

    nameCtrl.clear();

    setState(() {
      gender = "Male";
      agree = false;
    });
  }

  Future<void> _delete(int index) async {
    items.removeAt(index);

    final pref = await SharedPreferences.getInstance();

    await pref.setString(
      _key,
      jsonEncode(items),
    );

    setState(() {});
  }

  // Update selected record
  Future<void> _update() async {
    if (editingIndex == null) return;

    if (nameCtrl.text.trim().isEmpty) return;

    items[editingIndex!] = {
      'name': nameCtrl.text,
      'gender': gender,
      'agree': agree,
    };

    final pref = await SharedPreferences.getInstance();

    await pref.setString(
      _key,
      jsonEncode(items),
    );

    setState(() {
      editingIndex = null;
      nameCtrl.clear();
      gender = "Male";
      agree = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
              ),
            ),

            RadioListTile<String>(
              title: const Text('Male'),
              value: 'Male',
              groupValue: gender,
              onChanged: (String? value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            RadioListTile<String>(
              title: const Text('Female'),
              value: 'Female',
              groupValue: gender,
              onChanged: (value) {
                setState(() {
                  gender = value!;
                });
              },
            ),

            CheckboxListTile(
              title: const Text('Agree'),
              value: agree,
              onChanged: (value) {
                setState(() {
                  agree = value!;
                });
              },
            ),

            ElevatedButton(
              onPressed: editingIndex == null ? _save : _update,
              child: Text(
                editingIndex == null ? 'Save' : 'Update',
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final i1 = items[index];

                  return ListTile(
                    title: Text('Name: ${i1['name']}'),
                    subtitle: Text(
                      'Gender: ${i1['gender']}, Agree: ${i1['agree']}',
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _delete(index),
                        ),

                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            // Only load data into the form
                            setState(() {
                              editingIndex = index;
                              nameCtrl.text = i1['name'];
                              gender = i1['gender'];
                              agree = i1['agree'];
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}