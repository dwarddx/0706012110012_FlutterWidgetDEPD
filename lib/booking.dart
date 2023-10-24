import 'package:flutter/material.dart';
import 'home.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Gagal'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showConfirmationDialog() {
    String message =
        'Full Name: ${_fullNameController.text}\nEmail: ${_emailController.text}\nPhone Number: ${_phoneNumberController.text}\nCity: ${_cityController.text}';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Booking Confirmation'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => HomePage()));
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Form'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.yellow],
          ),
        ),
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(), // Enable scrolling even when there's not enough content
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: MediaQuery.of(context).size.height),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _fullNameController,
                      decoration: InputDecoration(
                          labelText: 'Full Name',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your full name';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter only letters';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Icon(Icons.mail)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email address';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _phoneNumberController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.call),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        } else if (value.length < 8 || value.length > 13) {
                          return 'Phone number must be between 8 and 13 digits';
                        } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Please enter only digits';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _cityController,
                      decoration: InputDecoration(
                          labelText: 'City',
                          prefixIcon: Icon(Icons.location_city)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your city';
                        }
                        if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
                          return 'Please enter only letters';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          // All text fields are valid, show confirmation dialog
                          _showConfirmationDialog();
                        } else {
                          // Some text fields are not valid, show error dialog
                          _showErrorDialog(
                              'Please fill out all fields correctly.');
                        }
                      },
                      child: Text(
                        'Submit Booking',
                        style: TextStyle(
                            color: const Color.fromARGB(
                                255, 54, 54, 54)), // Set text color to yellow
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white, // Background color of the button
                        onPrimary: Color.fromARGB(
                            255, 201, 187, 54), // Color when button is pressed
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Border radius of the button
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8), // Padding inside the button
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
