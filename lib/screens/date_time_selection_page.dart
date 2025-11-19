// ==================== DateTimeSelectionPage ====================
import 'package:flutter/material.dart';
import 'package:final_project/screens/profile_page.dart';

class DateTimeSelectionPage extends StatefulWidget {
  @override
  _DateTimeSelectionPageState createState() => _DateTimeSelectionPageState();
}

class _DateTimeSelectionPageState extends State<DateTimeSelectionPage> {
  final List<int> _days = List.generate(30, (index) => index + 1);
  int? selectedStartDay;
  int? selectedEndDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Date & Time',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: Icon(Icons.person_outline, color: Colors.white),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildCalendarBox(),
            SizedBox(height: 30),
            _buildSelectedDates(),
            SizedBox(height: 40),

            // زر Apply
            ElevatedButton(
              onPressed: () {
                if (selectedStartDay == null || selectedEndDay == null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content:
                            Text('Please select both start and end dates.')),
                  );
                  return;
                }

                DateTime start = DateTime(2020, 6, selectedStartDay!);
                DateTime end = DateTime(2020, 6, selectedEndDay!);

                Navigator.pop(context, {
                  "start": start,
                  "end": end,
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF0083A7),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Apply",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  // --------------------- صندوق التقويم ---------------------
  Widget _buildCalendarBox() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        _buildMonthHeader(),
        SizedBox(height: 12),
        _buildWeekDays(),
        SizedBox(height: 12),
        _buildCalendarGrid(),
      ]),
    );
  }

  // --------------------- عنوان الشهر ---------------------
  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "June 2020",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // --------------------- أيام الأسبوع ---------------------
  Widget _buildWeekDays() {
    final List<String> days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: days
          .map((d) => Text(d,
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold)))
          .toList(),
    );
  }

  // --------------------- التقويم ---------------------
  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7),
      itemCount: 30,
      itemBuilder: (context, index) {
        int day = index + 1;

        bool isStart = selectedStartDay == day;
        bool isEnd = selectedEndDay == day;
        bool isBetween = selectedStartDay != null &&
            selectedEndDay != null &&
            day > selectedStartDay! &&
            day < selectedEndDay!;

        return GestureDetector(
          onTap: () {
            setState(() {
              if (selectedStartDay == null) {
                selectedStartDay = day;
              } else if (selectedEndDay == null && day > selectedStartDay!) {
                selectedEndDay = day;
              } else {
                selectedStartDay = day;
                selectedEndDay = null;
              }
            });
          },
          child: Container(
            margin: EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: isStart || isEnd
                  ? Color(0xFF0083A7)
                  : isBetween
                      ? Color(0xFF0083A7).withOpacity(0.4)
                      : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.black26),
            ),
            child: Center(
              child: Text(
                "$day",
                style: TextStyle(
                  color: isStart || isEnd ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  // --------------------- عرض التواريخ المختارة ---------------------
  Widget _buildSelectedDates() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _dateBox(
          label: "Start",
          value: selectedStartDay != null ? "June ${selectedStartDay!}" : "- -",
        ),
        _dateBox(
          label: "End",
          value: selectedEndDay != null ? "June ${selectedEndDay!}" : "- -",
        ),
      ],
    );
  }

  Widget _dateBox({required String label, required String value}) {
    return Container(
      padding: EdgeInsets.all(14),
      width: 150,
      decoration: BoxDecoration(
          color: Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.bold)),
          SizedBox(height: 6),
          Text(value,
              style: TextStyle(
                  color: Color(0xFF0083A7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
        ],
      ),
    );
  }
}
