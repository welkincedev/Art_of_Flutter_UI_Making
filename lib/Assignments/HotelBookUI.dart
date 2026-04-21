import 'package:flutter/material.dart';

class HoteBookUI extends StatefulWidget {
  @override
  State<HoteBookUI> createState() => _HoteBookUIState();
}

class _HoteBookUIState extends State<HoteBookUI> {
  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "🏨Hotel Booking",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Book Your Perfect Stay",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [


              Text(
                "Search Hotels",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              SizedBox(height: 10),
              Text("City", style: TextStyle(fontSize: 14, color: Colors.black)),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: "Cities",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Checkin Date",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: checkInDate,
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => checkInDate = picked);
                  }
                },
                child: Text(
                  '📅 ${checkInDate.toLocal().toString().split(' ')[0]}',
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Checkout Date",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: checkOutDate,
                    firstDate: DateTime(1930),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) {
                    setState(() => checkOutDate = picked);
                  }
                },
                child: Text(
                  '📅 ${checkOutDate.toLocal().toString().split(' ')[0]}',
                ),
              ),
              SizedBox(height: 10),

              Text(
                "Preffered Checkin Time",
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: selectedTime,
                  );
                  if (picked != null) {
                    setState(() => selectedTime = picked);
                  }
                },
                child: Text(
                  '📅 ${selectedTime.format(context)}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
