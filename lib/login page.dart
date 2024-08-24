import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => LoginPage();
}

class LoginPage extends State<Login> {
  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  void authenticate()
  {
    var email=emailController.text.toString();
    var password=passwordController.text.toString();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          height: 350,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 18),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter your e-mail id',
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  prefixIcon: Icon(Icons.email_sharp),
                ),
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 18),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  prefixIcon: Icon(Icons.remove_red_eye_sharp),
                ),
                keyboardType: TextInputType.text,
                obscureText: true,
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: ()
                {

                },
                child: Text('Submit', style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
