/*import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  final String movie;

  BookingScreen({required this.movie});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  //String movie;
  //String selectedFormat = "";
  //int selectedFormatIndex = -1;
  int selectedFormatIndex = -1;
  int selectedDateIndex = -1;
  int selectedTimeIndexHallA = -1;
  int selectedTimeIndexHallB = -1;
  //BookingScreen({required this.movie});

  List formats = [
    "2D",
    "3D",
    "4DX",
    "IMAX",
  ];

  List days = [
    "S",
    "M",
    "Tu",
    "W",
    "Th",
    "F",
    "Sa",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212429),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                    "images/${widget.movie}.jpg",
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(widget.movie,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Format:",
                        style: TextStyle(
                          color: Color(0xFFF7D300),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                          height: 25,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedFormatIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: index == selectedFormatIndex
                                        ? Color(0xFFF7D300)
                                        : Color(0xFF212429),
                                    borderRadius: BorderRadius.circular(5),
                                    border: index != selectedFormatIndex
                                        ? Border.all(color: Colors.white60)
                                        : null,
                                  ),
                                  child: Center(
                                      child: Text(
                                    formats[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
                                  )),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Select Date:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedDateIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: index == selectedDateIndex
                                    ? Color(0xFFF7D300)
                                    : null,
                                borderRadius: BorderRadius.circular(5),
                                //border: index != 1
                                //  ? Border.all(color: Colors.white60)
                                //: null,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    days[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${index + 8}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF7D300),
                      ),
                      Text("City Complex Cinema",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(),
                      Text("Hall A",
                          style: TextStyle(
                            color: Colors.white70,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Select Time:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTimeIndexHallA = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: index == selectedTimeIndexHallA
                                    ? Color(0xFFF7D300)
                                    : Colors.white24,
                                borderRadius: BorderRadius.circular(5),
                                border: index != selectedTimeIndexHallA
                                    ? Border.all(color: Colors.white30)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 8} : 30 AM",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF7D300),
                      ),
                      Text("City Complex Cinema",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(),
                      Text("Hall B",
                          style: TextStyle(
                            color: Colors.white70,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Select Time:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTimeIndexHallB = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: index == selectedTimeIndexHallB
                                  ? Color(0xFFF7D300)
                                  : Colors.white24,
                              borderRadius: BorderRadius.circular(5),
                              border: index != selectedTimeIndexHallB
                                  ? Border.all(color: Colors.white30)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 11} : 30 AM",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                      color: Color(0xfff7d300).withOpacity(0.9),
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                          onTap: () {},
                          child: Container(
                              height: 55,
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                  child: Text("Book Tickets",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ))))))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}*/

//import 'package:demo1/screens/seat_selection_screen.dart';
import 'seat_selection_screen.dart ';
import 'package:flutter/material.dart';
//import 'SeatSelectionScreen.dart';

class BookingScreen extends StatefulWidget {
  final String movie;

  BookingScreen({required this.movie});

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int selectedFormatIndex = -1;
  int selectedDateIndex = -1;
  int selectedTimeIndexHallA = -1;
  int selectedTimeIndexHallB = -1;

  List formats = ["2D", "3D", "4DX", "IMAX"];
  List days = ["S", "M", "Tu", "W", "Th", "F", "Sa"];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFF212429),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.2,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                    "images/${widget.movie}.jpg",
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.6,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                              size: 25,
                            ),
                            SizedBox(width: 10),
                            Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 25,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(widget.movie,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ))),
                ],
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Format:",
                        style: TextStyle(
                          color: Color(0xFFF7D300),
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                          height: 25,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedFormatIndex = index;
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: index == selectedFormatIndex
                                        ? Color(0xFFF7D300)
                                        : Color(0xFF212429),
                                    borderRadius: BorderRadius.circular(5),
                                    border: index != selectedFormatIndex
                                        ? Border.all(color: Colors.white60)
                                        : null,
                                  ),
                                  child: Center(
                                      child: Text(
                                    formats[index],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white70,
                                    ),
                                  )),
                                ),
                              );
                            },
                          ))
                    ],
                  ),
                  SizedBox(height: 20),
                  Text("Select Date:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                      height: 70,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedDateIndex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 8),
                              decoration: BoxDecoration(
                                color: index == selectedDateIndex
                                    ? Color(0xFFF7D300)
                                    : null,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    days[index],
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${index + 8}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF7D300),
                      ),
                      Text("City Complex Cinema",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(),
                      Text("Hall A",
                          style: TextStyle(
                            color: Colors.white70,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Select Time:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedTimeIndexHallA = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: index == selectedTimeIndexHallA
                                    ? Color(0xFFF7D300)
                                    : Colors.white24,
                                borderRadius: BorderRadius.circular(5),
                                border: index != selectedTimeIndexHallA
                                    ? Border.all(color: Colors.white30)
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  "${index + 8} : 30 AM",
                                  style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Color(0xFFF7D300),
                      ),
                      Text("City Complex Cinema",
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          )),
                      Spacer(),
                      Text("Hall B",
                          style: TextStyle(
                            color: Colors.white70,
                          ))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text("Select Time:",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(height: 8),
                  SizedBox(
                    height: 30,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedTimeIndexHallB = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: index == selectedTimeIndexHallB
                                  ? Color(0xFFF7D300)
                                  : Colors.white24,
                              borderRadius: BorderRadius.circular(5),
                              border: index != selectedTimeIndexHallB
                                  ? Border.all(color: Colors.white30)
                                  : null,
                            ),
                            child: Center(
                              child: Text(
                                "${index + 11} : 30 AM",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Material(
                    color: Color(0xfff7d300).withOpacity(0.9),
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        String selectedFormat = formats[selectedFormatIndex];
                        String selectedDate = days[selectedDateIndex];
                        String selectedTime = "";

                        if (selectedTimeIndexHallA != -1) {
                          selectedTime =
                              "${selectedTimeIndexHallA + 8} : 30 AM";
                        } else if (selectedTimeIndexHallB != -1) {
                          selectedTime =
                              "${selectedTimeIndexHallB + 11} : 30 AM";
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeatSelectionScreen(
                              movie: widget.movie,
                              selectedFormat: selectedFormat,
                              selectedDate: selectedDate,
                              selectedTime: selectedTime,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Text(
                            "Book Tickets",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
