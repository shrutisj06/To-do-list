import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'We are working on our first app',
            style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'font main'),
          ),
        ),
        body: Center(
            child: Container(
                width: 250,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextField(
                        decoration: InputDecoration(border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),

                            suffixIcon: (IconButton(
                              icon: const Icon(
                                Icons.remove_red_eye,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            )),
                            prefixIcon:Icon( Icons.email_outlined),
                            prefixText: 'enter username')

                    ),

                    Container(
                      width: 250,
                      child: TextField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.red))),
                      ),
                    )
                  ],
                ))));
  }
}
