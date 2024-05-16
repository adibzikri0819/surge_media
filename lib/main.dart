
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'StartPage.dart';
import 'package:device_preview/device_preview.dart';


void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
  return MaterialApp(
    useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    title: 'Flutter Demo',
    home: Home(),
  );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Login',
            style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF6F6F6),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                    hintStyle: TextStyle(color: const Color(0xFF8A8585), fontFamily: 'Roboto'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color(0xFFF6F6F6)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Text(
                'Password',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: 'Roboto'),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xFFF6F6F6),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
                    hintStyle: TextStyle(color: const Color(0xFF8A8585), fontFamily: 'Roboto'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: const Color(0xFFF6F6F6)),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  Text('Remember Me', style: TextStyle(fontFamily: 'Roboto')),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Forgot Password', style: TextStyle(fontFamily: 'Roboto', color: Colors.black)),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Center(
                child: SizedBox(
                  width: 150, // Set the desired width here
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StartPage()),
                        );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(fontFamily: 'Roboto', color: Colors.white)),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account, '),
                  Text(
                    'sign up',
                    style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

