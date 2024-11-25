import 'package:flutter/material.dart';

void main() {
  runApp(DentistApp());
}

class DentistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dentist Appointment App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home');
    });

    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to Dentist App',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Dentist App",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
              background: Image.asset(
                "assets/dentist.jpg", // تأكد من إضافة الصورة إلى ملف pubspec.yaml
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              _buildListTile(context, Icons.date_range, "Pick Date"),
              _buildListTile(context, Icons.access_time, "Pick Time"),
              _buildListTile(context, Icons.image, "Add Insurance Image"),
              _buildListTile(context, Icons.slideshow, "Appointment Preference Slider"),
              _buildListTile(context, Icons.linear_scale, "Time Range Slider"),
            ]),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ActivityScreen(title: title)),
        );
      },
    );
  }
}

class ActivityScreen extends StatefulWidget {
  final String title;
  ActivityScreen({required this.title});

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  double sliderValue = 0;
  RangeValues rangeSliderValues = RangeValues(0, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
            children: [
        if (widget.title == "Pick Date")
        ListTile(
        leading: Icon(Icons.date_range),
    title: Text('Pick Date'),
    onTap: () {
    showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2101),
    ).then((date) {
    setState(() {
    selectedDate = date;
    });
    });
    },
    ),
    if (widget.title == "Pick Time")
    ListTile(
    leading: Icon(Icons.access_time),
    title: Text('Pick Time'),
    onTap: () {
    showTimePicker(
    context: context,

