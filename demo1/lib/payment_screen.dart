// TODO Implement this library.
/*import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String movie;
  final String selectedFormat;
  final String selectedDate;
  final String selectedTime;
  final List<String> selectedSeats;
  final double totalCost;

  PaymentScreen({
    required this.movie,
    required this.selectedFormat,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.totalCost,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController otpController = TextEditingController();
  double calculateTotalCost() {
    // Provide your logic to calculate the total cost based on selected seats
    // This is just a placeholder
    return widget.selectedSeats.length * 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Cost: \$${calculateTotalCost()}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              decoration: InputDecoration(labelText: 'Enter OTP'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check if the entered OTP is valid (for simplicity, using '123456')
                if (otpController.text == '123456') {
                  // Payment successful, show ticket
                  _showTicket();
                } else {
                  // Payment failed, show an error message
                  _showErrorDialog();
                }
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }

  void _showTicket() {
    // Provide your logic to display the ticket or navigate to a success screen
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Column(
            children: [
              Text('Movie: ${widget.movie}'),
              Text('Format: ${widget.selectedFormat}'),
              Text('Date: ${widget.selectedDate}'),
              Text('Time: ${widget.selectedTime}'),
              Text('Selected Seats: ${widget.selectedSeats.join(', ')}'),
              Text('Total Cost: \$${calculateTotalCost()}'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // You can navigate to the home screen or perform other actions
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Failed'),
          content: Text('Invalid OTP. Please try again.'),
          actions: [
            ElevatedButton(
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
}*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  final String movie;
  final String selectedFormat;
  final String selectedDate;
  final String selectedTime;
  final List<String> selectedSeats;
  final double totalCost;

  PaymentScreen({
    required this.movie,
    required this.selectedFormat,
    required this.selectedDate,
    required this.selectedTime,
    required this.selectedSeats,
    required this.totalCost,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  TextEditingController otpController = TextEditingController();
  //TextEditingController otpController = TextEditingController();
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  double calculateTotalCost() {
    // Provide your logic to calculate the total cost based on selected seats
    // This is just a placeholder
    return widget.selectedSeats.length * 10.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Total Cost: \$${calculateTotalCost()}',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: otpController,
              style: TextStyle(color: Colors.white), // Set text color to white
              decoration: InputDecoration(
                labelText: 'Enter OTP',
                labelStyle:
                    TextStyle(color: Colors.white), // Set label color to white
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Check if the entered OTP is valid (for simplicity, using '123456')
                if (otpController.text == '123456') {
                  // Payment successful, show ticket
                  _showTicket();
                } else {
                  // Payment failed, show an error message
                  _showErrorDialog();
                }
              },
              child: Text('Make Payment',
                  style: TextStyle(
                      color: Colors.black)), // Set button text color to white
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.yellow), // Set button color
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showTicket() {
    // Provide your logic to display the ticket or navigate to a success screen
    //CollectionReference bookings =
    // FirebaseFirestore.instance.collection('bookings');

    /*bookings
        .add({
          'movie': widget.movie,
          'format': widget.selectedFormat,
          'date': widget.selectedDate,
          'time': widget.selectedTime,
          'seats': widget.selectedSeats,
          'totalCost': widget.totalCost,
          // Add other relevant fields
        })
        .then((value) => print("Booking added with ID: ${value.id}"))
        .catchError((error) => print("Failed to add booking: $error"));*/

    _database.child('bookings').push().set({
      'movie': widget.movie,
      'format': widget.selectedFormat,
      'date': widget.selectedDate,
      'time': widget.selectedTime,
      'seats': widget.selectedSeats,
      'totalCost': widget.totalCost,
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text('Payment Successful', style: TextStyle(color: Colors.white)),
          content: Column(
            children: [
              Text('Movie: ${widget.movie}',
                  style: TextStyle(color: Colors.white)),
              Text('Format: ${widget.selectedFormat}',
                  style: TextStyle(color: Colors.white)),
              Text('Date: ${widget.selectedDate}',
                  style: TextStyle(color: Colors.white)),
              Text('Time: ${widget.selectedTime}',
                  style: TextStyle(color: Colors.white)),
              Text('Selected Seats: ${widget.selectedSeats.join(', ')}',
                  style: TextStyle(color: Colors.white)),
              Text('Total Cost: \Rs.${calculateTotalCost()}',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
          backgroundColor: Colors.black, // Set background color
          actions: [
            ElevatedButton(
                onPressed: () {
                  // You can navigate to the home screen or perform other actions
                  Navigator.of(context).pop();
                },
                child: Text('Close', style: TextStyle(color: Colors.black)),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow),
                )),
          ],
        );
      },
    );
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Payment Failed', style: TextStyle(color: Colors.white)),
          content: Text('Invalid OTP. Please try again.',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black, // Set background color
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
