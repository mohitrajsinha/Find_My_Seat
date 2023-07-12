import 'package:flutter/material.dart';

class SeatSearchBox extends StatefulWidget {
  final List<List<String>> seatLayout;
  final Function(String) searchSeat;

  const SeatSearchBox({
    Key? key,
    required this.seatLayout,
    required this.searchSeat,
  }) : super(key: key);

  @override
  _SeatSearchBoxState createState() => _SeatSearchBoxState();
}

class _SeatSearchBoxState extends State<SeatSearchBox> {
  String seatNumber = '';

  void searchSeat() {
    widget.searchSeat(seatNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  hintText: 'Enter seat number',
                ),
                onChanged: (value) {
                  seatNumber = value;
                },
              ),
            ),
            const SizedBox(width: 10.0),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                onPressed: searchSeat,
                child: const Text('Search'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
      ],
    );
  }
}
