import 'package:flutter/material.dart';

class DateTimeSelectionPage extends StatefulWidget {
  @override
  _DateTimeSelectionPageState createState() => _DateTimeSelectionPageState();
}

class _DateTimeSelectionPageState extends State<DateTimeSelectionPage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  final List<int> _days = List.generate(30, (index) => index + 1);
  final int _currentMonthDay = 4;
  final int _selectedDay = 22;

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(buildContext);
          },
        ),
        title: Text(
          'Date & Time',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.person_outline, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(
            color: Colors.white.withOpacity(0.2),
            height: 1.0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  _buildMonthHeader(),
                  SizedBox(height: 15),
                  _buildWeekDays(),
                  SizedBox(height: 10),
                  _buildCalendarGrid(),
                  SizedBox(height: 20),
                  Divider(color: Colors.white.withOpacity(0.2)),
                  SizedBox(height: 20),
                  _buildTimePicker(),
                ],
              ),
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: _buildInfoCard(
                    context: buildContext,
                    title: 'Delivery',
                    date: 'June 23',
                    time: '9 : 00 PM',
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildInfoCard(
                    context: buildContext,
                    title: 'Receive',
                    date: 'June 20',
                    time: '11 : 00 AM',
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(buildContext, '/');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF0083A7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
                child: Text(
                  'Applied',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMonthHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.arrow_back_ios, color: Colors.white.withOpacity(0.7), size: 16),
        Row(
          children: [
            Text(
              'June 2020',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16),
          ],
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.white.withOpacity(0.7), size: 16),
      ],
    );
  }

  Widget _buildWeekDays() {
    final List<String> weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: weekDays.map((day) => Text(day, style: TextStyle(color: Colors.black, fontSize: 12))).toList(),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.0,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: 30 + 3,
      itemBuilder: (context, index) {
        if (index < 3) {
          return Container();
        }
        final day = _days[index - 3];
        bool isActiveDay = day == _currentMonthDay;
        bool isSelectedDay = day == _selectedDay;

        return GestureDetector(
          onTap: () {
            setState(() {
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isActiveDay ? Color(0xFF0083A7) : (isSelectedDay ? Color(0xFF0083A7).withOpacity(0.7) : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
              border: isActiveDay || isSelectedDay ? null : Border.all(color: Colors.grey.withOpacity(0.3)),
            ),
            child: Text(
              '$day',
              style: TextStyle(
                color: isActiveDay || isSelectedDay ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimePicker() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Time',
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
        SizedBox(width: 20),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            '11:38',
            style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(width: 10),
        _buildTimePeriodButton('AM', true),
        SizedBox(width: 10),
        _buildTimePeriodButton('PM', false),
      ],
    );
  }

  Widget _buildTimePeriodButton(String text, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white.withOpacity(0.2) : Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(color: isSelected ? Colors.black : Colors.black, fontSize: 14),
      ),
    );
  }

  Widget _buildInfoCard({
    required BuildContext context,
    required String title,
    required String date,
    required String time,
  }) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                time,
                style: TextStyle(color: Color(0xFF0083A7), fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black.withOpacity(0.7), size: 14),
            ],
          ),
        ],
      ),
    );
  }
}