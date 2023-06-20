import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const appTitle = 'User Form';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            appTitle,
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF00CCFF),
                  Color(0xFF3366FF),
                ],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
              ),
            ),
          ),
        ),
        body: const MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatelessWidget {
  const MyCustomForm({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your Phone Number',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your NIC',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: Text(
              'Enter Your Drivers License Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Id',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter your License Expiry Date',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: Text(
              'Enter Your Gender',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: RadioExample(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: Text(
              'User Sub Type',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter User Sub Type',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Document 01',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Document 02',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: Text(
              'User Profile Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'First Name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Last name',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Email Address',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Profile Picture url',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Emergency Contact',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Authorization',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum SingingCharacter { male, female }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.male;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
