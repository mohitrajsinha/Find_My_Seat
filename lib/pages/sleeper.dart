import 'package:flutter/material.dart';

import '../utils/seat_search_box.dart';

class SleeperPage extends StatefulWidget {
  const SleeperPage({super.key});

  @override
  _SleeperPageState createState() => _SleeperPageState();
}

class _SleeperPageState extends State<SleeperPage> {
  final List<List<String>> seatLayout = [
    ['1', '2', '3', '', '7'],
    ['4', '5', '6', '', '8'],
    ['9', '10', '11', '', '15'],
    ['12', '13', '14', '', '16'],
    ['17', '18', '19', '', '23'],
    ['20', '21', '22', '', '24'],
    ['25', '26', '27', '', '31'],
    ['28', '29', '30', '', '32'],
    ['33', '34', '35', '', '39'],
    ['36', '37', '38', '', '40'],
    ['41', '42', '43', '', '47'],
    ['44', '45', '46', '', '48'],
    ['49', '50', '51', '', '55'],
    ['52', '53', '54', '', '56'],
    ['57', '58', '59', '', '63'],
    ['60', '61', '62', '', '64'],
    ['65', '66', '67', '', '71'],
    ['68', '69', '70', '', '72'],
    ['73', '74', '75', '', '79'],
    ['76', '77', '78', '', '80'],
    ['81', '82', '83', '', '87'],
    []
  ];

  String? searchedSeat;
  final ScrollController _scrollController = ScrollController();

  void searchSeat(String seatNumber) {
    setState(() {
      searchedSeat = seatNumber;
    });

    if (seatNumber.isNotEmpty) {
      final rowIndex = seatLayout.indexWhere((row) => row.contains(seatNumber));
      if (rowIndex != -1) {
        _scrollToSeat(rowIndex);
      }
    }
  }

  void _scrollToSeat(int rowIndex) {
    _scrollController.animateTo(
      rowIndex * 60.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        title: const Text('Seat Finder'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text(
                'Enter Seat Number',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              SeatSearchBox(
                seatLayout: seatLayout,
                searchSeat: searchSeat,
              ),
              const SizedBox(height: 20.0),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: SeatGrid(
                    seatLayout: seatLayout,
                    searchedSeat: searchedSeat,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeatGrid extends StatelessWidget {
  final List<List<String>> seatLayout;
  final String? searchedSeat;

  const SeatGrid({
    Key? key,
    required this.seatLayout,
    required this.searchedSeat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (seatLayout[0].length + 1) * 80.0 + (seatLayout[0].length) * 8.0,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: seatLayout.length * seatLayout[0].length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: seatLayout[0].length + 1,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 0,
            childAspectRatio: (80 + 8) / 120),
        itemBuilder: (BuildContext context, int index) {
          final rowIndex = index ~/ (seatLayout[0].length + 1);
          final columnIndex = index % (seatLayout[0].length + 1);

          if (columnIndex == 3) {
            return const SizedBox.shrink(); // Skip aisle position
          }

          final seatIndex = columnIndex > 2 ? columnIndex - 1 : columnIndex;
          if (rowIndex >= 18 || seatIndex >= seatLayout[rowIndex].length) {
            return const SizedBox.shrink();
          }

          final seatNumber = seatLayout[rowIndex][seatIndex];
          if (seatNumber.isEmpty) {
            return const SizedBox.shrink(); // Skip empty seats
          }

          return Column(
            children: [
              SizedBox(
                  height:
                      rowIndex % 2 == 1 ? 9.0 : 0.0), // Add gap between rows
              buildSeatContainer(seatNumber, columnIndex, rowIndex),
            ],
          );
        },
      ),
    );
  }

  Widget buildSeatContainer(String seatNumber, int columnIndex, int rowIndex) {
    // final isAisleSeat = columnIndex == seatLayout[0].length;
    const boxSize = 54.0; // Adjust the size of the box as desired

    final isSearchedSeat = seatNumber == searchedSeat;

    String seatName = '';

    if (columnIndex == 0) {
      seatName = 'Lower';
    } else if (columnIndex == 1) {
      seatName = 'Middle';
    } else if (columnIndex == 2) {
      seatName = 'Upper';
    } else if (columnIndex == 5 && rowIndex % 2 == 0) {
      seatName = 'SL';
    } else {
      seatName = 'SU';
    }

    return Container(
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: isSearchedSeat ? Colors.orange : const Color.fromRGBO(50, 115, 168, 5),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            seatName,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4.0),
          Text(
            seatNumber,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
