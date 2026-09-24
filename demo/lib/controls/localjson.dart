import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserForm extends StatefulWidget {
  const UserForm({super.key});

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm>{
  final nameCtrl = TextEditingController();
  String gender = "Male";
  bool agree= false;
  List<Map<String, dynamic>> items = [];
  static const String _key = "entries";

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
    if(raw == null) return;
    final list = jsonDecode(raw) as List;
    setState(()  {
      items = list.cast<Map<String, dynamic>>();
    });
  }

  Future<void> _save() async {
    if(nameCtrl.text.trim().isEmpty) return;
    items.add({
      'name': nameCtrl.text,
      'gender': gender,
      'agree': agree,
    });
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_key, jsonEncode(items));
    nameCtrl.clear();
    setState(() {
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
            children:[
              TextField(
                controller: nameCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                )
              ),
              RadioListTile<String>(
                title: const Text('Male'),
                value: 'Male',
                groupValue: gender,
                onChanged: (String? value) {
                  setState(() =>
                    gender = value!
                  );
                },
              ),
              RadioListTile<String>(
                title: const Text('Female'),
                value: 'Female',
                groupValue: gender,
                onChanged: (value) {
                  setState(() =>
                    gender = value!
                  );
                },
              ),
              CheckboxListTile(value: value, onChanged: onChanged),
              ElevatedButton(),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder()
              )
            ]
          )
        )
      );
    }
}