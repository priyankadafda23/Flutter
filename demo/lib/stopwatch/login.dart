import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loggedIn = false;
  String name='';
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: loggedIn ? _buildSuccess() : _buildLoginForm(),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.check,color: Colors.green,size: 100,),
        const SizedBox(height: 20,),
        Text("Welcome, $name!",style: const TextStyle(fontSize: 24),),
      ],
    );
  }

  Widget _buildLoginForm(){
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
              validator: (text) => text!.isEmpty ? "Name cannot be empty" : null,
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
              validator: (text){
                if(text!.isEmpty){
                  return "Email address cannot be empty";
                }
                final regex = RegExp('[^@]+@[^.]+..+');
                if(!regex.hasMatch(text)){
                  return "Please enter a valid email address";
                }
                return null;
              },
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: _validate,
              child: const Text("Login"),
            )
          ]
        )
      )
    );
  }

  void _validate(){
    final form = _formKey.currentState;
    if(form!=null && form.validate()){
      setState(() {
        loggedIn = true;
        name = _nameController.text;
      });
    }
  }
}