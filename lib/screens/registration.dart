import 'package:flutter/material.dart';
import 'home_screen.dart';


class RegScreen extends StatefulWidget {
  const RegScreen({Key? key}) : super(key: key);

  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/lsb.png'),fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
                validator: (input){
                  if(input == null || input.isEmpty){
                    return('please enter your username');
                  }
                  return null;
                } ,
                decoration: InputDecoration(prefixIcon: Icon(Icons.person),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: 'username',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.tealAccent,
                ),
              ),
              TextFormField(
                validator: (input){
                  if(input == null || input.isEmpty){
                    return('please enter your password');
                  }
                  return null;
                } ,
                obscureText: true,
                decoration: InputDecoration(prefixIcon: Icon(Icons.lock),enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: 'password',
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.tealAccent,
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                    }
                  },
                  child: const Text('submit')
              )
            ],
          ),
        ),
      ),
    );
  }
}
