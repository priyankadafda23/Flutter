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
  int temp_Index = 0;

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

  Future<void> _delete(index) async {
    items.removeAt(index);
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_key, jsonEncode(items));
    setState(() {});
  }

  void _update_index(index){
    temp_Index = index;
    nameCtrl.text = items[index]['name'];
    gender = items[index]['gender'];
    agree = items[index]['agree'];
  }

  Future<void> _update(index) async {
    if(nameCtrl.text.trim().isEmpty) return;
    items[temp_Index] = {
      'name': nameCtrl.text,
      'gender': gender,
      'agree': agree,
    };
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
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final i1 = items[index];
                    return ListTile(
                      title: Text('Name: ${i1['name']}'),
                      subtitle: Text('Gender: ${i1['gender']}, Agree: ${i1['agree']}'),
                      trailing:
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: ()=> _delete(index),
                        ),
                        leading: IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: ()=>
                            _update_index(index),
                        ),
                    );
                  }
                ),
              ),
            ]
          ),
        ),
      );
    }
}