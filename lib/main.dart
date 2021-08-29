import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';




void main() => runApp(MaterialApp(
      title: 'InPour',
      home: InPour(),
    ));

class InPour extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Text('Could not load app')
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: Scaffold(
              body: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        "In Pour",
                        style: (TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                      ),
                    ),
                    Icon(Icons.person_outline, color: Colors.black, size: 75),
                    Padding(
                      padding: const EdgeInsets.only(left: 60, top: 155, right: 60),
                      child: const TextField(
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Phone Number',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerificationScreen()),
                          );
                        },
                        child: Text("Login"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: TextButton(
                        onPressed: () {
                          // Respond to button press
                        },
                        child: Text("Sign Up"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }



        // Otherwise, show something whilst waiting for initialization to complete
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget> [
                CircularProgressIndicator(
                backgroundColor: Theme.of(context).primaryColor,
            )
                ]
            )
          ]);
      },
    );
  }
}

//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: Scaffold(
//        body: Center(
//          child: Column(
//            children: [
//              Padding(
//                padding: const EdgeInsets.only(top: 100),
//                child: Text(
//                  "In Pour",
//                  style: (TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold,
//                  )),
//                ),
//              ),
//              Icon(Icons.person_outline, color: Colors.black, size: 75),
//              Padding(
//                padding: const EdgeInsets.only(left: 60, top: 155, right: 60),
//                child: const TextField(
//                  keyboardType: TextInputType.phone,
//                  textAlign: TextAlign.center,
//                  obscureText: true,
//                  decoration: InputDecoration(
//                    border: OutlineInputBorder(),
//                    labelText: 'Phone Number',
//                  ),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 20),
//                child: OutlinedButton(
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => VerificationScreen()),
//                    );
//                  },
//                  child: Text("Login"),
//                ),
//              ),
//              Padding(
//                padding: const EdgeInsets.only(top: 10),
//                child: TextButton(
//                  onPressed: () {
//                    // Respond to button press
//                  },
//                  child: Text("Sign Up"),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}

class VerificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 125),
            child: Text(
              "Verify Phone Number",
              textAlign: TextAlign.center,
              style: (TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, top: 40, right: 35),
            child: Text(
              "A text message was sent out to verify your Phone Number. Please enter the verification code below",
              textAlign: TextAlign.center,
              style: (TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.normal,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, top: 60, right: 60),
            child: const TextField(
              keyboardType: TextInputType.phone,
              textAlign: TextAlign.center,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Verification Code',
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 80, top: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("   Submit   "),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Re-Send Text"),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
