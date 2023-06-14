import 'dart:ui';
import 'package:flutter/material.dart';
import '../utils/catagory.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildSeriesTab(),
          _buildMoviesTab(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  AppBar _buildAppBar() => AppBar(
        flexibleSpace: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _buildAppBarTitle(),
        bottom: _buildTabBar(),
      );

  Widget _buildAppBarTitle() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Batın için'),
          Row(
            children: [
              Icon(Icons.airplay_outlined),
              SizedBox(width: 20),
              Icon(Icons.search_outlined),
              SizedBox(width: 20),
              _buildProfilePicture(),
            ],
          ),
        ],
      );

  Widget _buildProfilePicture() => Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/profilepicture1.jpg'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
      );

  PreferredSizeWidget _buildTabBar() => TabBar(
        controller: _tabController,
        tabs: [
          Tab(text: 'Diziler'),
          Tab(text: 'Filmler'),
        ],
      );

  Widget _buildSeriesTab() => SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 200),
                width: 350,
                height: 550,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/series/breakingbad.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 30,
                        child: Image.asset(
                          'assets/series/breakingbad_text.png',
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: categories
                  .map((category) =>
                      _buildCategory(category.title, category.images))
                  .toList(),
            ),
          ],
        ),
      );

  Widget _buildCategory(String text, List<String> images) => Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.only(top: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (BuildContext context, int index) {
                  final imageUrl = images[index];

                  return Container(
                    width: 150,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget _buildMoviesTab() => SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: 200),
                width: 350,
                height: 550,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          'assets/series/breakingbad.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 30,
                        child: Image.asset(
                          'assets/series/breakingbad_text.png',
                          height: 150,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: categories
                  .map((category) =>
                      _buildCategory(category.title, category.images))
                  .toList(),
            ),
          ],
        ),
      );

  Widget _buildBottomNavigationBar() => BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {},
        selectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana sayfa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriler',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download),
            label: 'İndirilenler',
          ),
        ],
      );
}
