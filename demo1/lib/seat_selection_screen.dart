// TODO Implement this library.
// seat_selection_screen.dart
/*
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatelessWidget {
  final String movie;
  final String selectedFormat;
  final String selectedDate;
  final String selectedTime;

  SeatSelectionScreen({
    required this.movie,
    required this.selectedFormat,
    required this.selectedDate,
    required this.selectedTime,
  });

  // Mock seat availability for demonstration
  List<List<bool>> seatAvailability =
      List.generate(8, (row) => List.filled(8, true));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Seats'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Movie: $movie',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
            Text(
              'Format: $selectedFormat',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              'Date: $selectedDate',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Text(
              'Time: $selectedTime',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Select Seats Here',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
            ),
            SizedBox(height: 20),
            // Display the grid of seats
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: List.generate(
                  seatAvailability.length,
                  (row) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      seatAvailability[row].length,
                      (col) => InkWell(
                        onTap: () {
                          // Handle seat selection logic here
                          // You may want to toggle the seat availability
                          // based on the user's selection.
                          if (seatAvailability[row][col]) {
                            // Seat is available, handle the selection
                            // For simplicity, we're just printing the selected seat for now.
                            print('Selected Seat: Row $row, Seat $col');
                          } else {
                            // Seat is not available, show a message or perform some action
                            print('Seat Row $row, Seat $col is not available');
                          }
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: seatAvailability[row][col]
                                ? Colors.green
                                : Colors.red,
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Text(
                              '${String.fromCharCode(65 + row)}$col', // Displaying seat labels (e.g., A0, A1, B0, B1, etc.)
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Button to proceed with the selected seats
            ElevatedButton(
              onPressed: () {
                // Implement logic to proceed with the selected seats
                // This could involve navigating to a payment screen or any other action.
                // For now, we're just printing a message.
                print('Proceeding with selected seats');
              },
              child: Text('Proceed with Selected Seats'),
            ),
          ],
        ),
      ),
    );
  }
}*/

//import 'package:flu/screens/payment_screen.dart';
import 'payment_screen.dart';
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  final String movie;
  final String selectedFormat;
  final String selectedDate;
  final String selectedTime;

  SeatSelectionScreen({
    required this.movie,
    required this.selectedFormat,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  List<String> selectedSeats = [];
  double costPerSeat = 10.0; // Set your cost per seat here

  List<List<bool>> seatStatus = List.generate(
    8,
    (index) => List.generate(8, (index) => false),
    growable: false,
  );

  @override
  Widget build(BuildContext context) {
    double totalCost = selectedSeats.length * costPerSeat;

    return Scaffold(
      appBar: AppBar(
        title: Text('Seat Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select your seats',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 350,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                ),
                itemCount: 64,
                itemBuilder: (context, index) {
                  int row = index ~/ 8;
                  int col = index % 8;
                  String seatId =
                      String.fromCharCode(65 + row) + (col + 1).toString();

                  return InkWell(
                    onTap: () {
                      setState(() {
                        // Toggle the seat status
                        seatStatus[row][col] = !seatStatus[row][col];

                        // Update selected seats list
                        if (seatStatus[row][col]) {
                          selectedSeats.add(seatId);
                        } else {
                          selectedSeats.remove(seatId);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color:
                            seatStatus[row][col] ? Colors.yellow : Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          seatId,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Total Cost: \Rs.${totalCost.toStringAsFixed(2)}', // Display total cost
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the payment screen with selected seat details
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentScreen(
                      movie: widget.movie,
                      selectedFormat: widget.selectedFormat,
                      selectedDate: widget.selectedDate,
                      selectedTime: widget.selectedTime,
                      selectedSeats: selectedSeats,
                      totalCost: totalCost,
                    ),
                  ),
                );
              },
              child: Text('Confirm Selection'),
            ),
          ],
        ),
      ),
    );
  }
}
