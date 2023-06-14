import 'package:flutter/material.dart';
import 'screenMain.dart'; // mainScreen.dart dosyasından MainScreen widget'ını içe aktarın

class ScreenUsers extends StatefulWidget {
  const ScreenUsers({Key? key}) : super(key: key);

  @override
  _ScreenUsersState createState() => _ScreenUsersState();
}

class _ScreenUsersState extends State<ScreenUsers> {
  bool showIcons = false; // İkonları göstermek veya gizlemek için bir bayrak

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Kullanıcılar'),
        actions: [
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text(
              'Düzenle',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              setState(() {
                showIcons = !showIcons;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _navigateToMainScreen(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(context, 'Batın', showIcons),
                  SizedBox(width: 20),
                  _buildBox(context, 'Mertcan', showIcons),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _navigateToMainScreen(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(context, 'Fatma', showIcons),
                  SizedBox(width: 20),
                  _buildBox(context, 'Tuğba', showIcons),
                ],
              ),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _navigateToMainScreen(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildBox(context, 'Kardiye', showIcons),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToMainScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (_, __, ___) => MainScreen(),
        transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
    );
  }

  Widget _buildBox(BuildContext context, String text, bool showIcons) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/profilepicture1.jpg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        if (showIcons)
          Icon(
            Icons.edit,
            color: Colors.white,
          ),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
