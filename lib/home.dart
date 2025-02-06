import 'package:flutter/material.dart';
import 'package:course_app/overview1.dart';
import 'package:course_app/overview2.dart';
import 'package:course_app/favourite.dart';
import 'package:course_app/MyCourses.dart';
import 'package:course_app/setting.dart';

void main() {
  runApp(const home());
}

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;

  // Screens for BottomNavigationBar
  final List<Widget> _screens = [
    const HomeScreen(),
    const favourite(),
    const MyCourses(),
    const setting(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _screens[_currentIndex], // Display the current screen
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> allLessons = [
    {
      "title": "Flutter",
      "description": "Description: All can be perfect in Flutter...",
      "price": "\$35",
      "rating": "4.3",
      "author": "by Cadani Beginner",
      "icon": Icons.favorite_border,
      "onTap": () => const overview1(),
    },
    {
      "title": "React",
      "description": "Description: All can be perfect in React...",
      "price": "\$45",
      "rating": "5.0",
      "author": "by Hanad Beginner",
      "icon": Icons.favorite_border,
      "onTap": () => const overview2(),
    }
  ];

  List<Map<String, dynamic>> filteredLessons = [];

  @override
  void initState() {
    super.initState();
    filteredLessons = allLessons;
    _searchController.addListener(_filterLessons);
  }

  void _filterLessons() {
    setState(() {
      filteredLessons = allLessons
          .where((lesson) => lesson["title"]
              .toLowerCase()
              .contains(_searchController.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hi, Abas',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, how are you today?',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.asset('assets/reactjs_banner.png', width: 300),
                  const SizedBox(width: 16),
                  Image.asset('assets/flutter_banner.jpg', width: 300),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Popular Lessons',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Column(
              children: filteredLessons.map((lesson) {
                return lesson["title"] == "Flutter"
                    ? LessonCardFlutter(
                        title: lesson["title"],
                        description: lesson["description"],
                        price: lesson["price"],
                        rating: lesson["rating"],
                        author: lesson["author"],
                        icon: lesson["icon"],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => lesson["onTap"](),
                            ),
                          );
                        },
                      )
                    : LessonCardReact(
                        title: lesson["title"],
                        description: lesson["description"],
                        price: lesson["price"],
                        rating: lesson["rating"],
                        author: lesson["author"],
                        icon: lesson["icon"],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => lesson["onTap"](),
                            ),
                          );
                        },
                      );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Favourite Screen'));
  }
}

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('My Courses Screen'));
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Settings Screen'));
  }
}

class LessonCardFlutter extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String author;
  final IconData icon;
  final VoidCallback onTap; // Add onTap callback

  const LessonCardFlutter({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.author,
    required this.icon,
    required this.onTap, // Accept onTap as a parameter
  });

  @override
  State<LessonCardFlutter> createState() => _LessonCardFlutterState();
}

class _LessonCardFlutterState extends State<LessonCardFlutter> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Handle the tap action
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const FlutterLogo(size: 48),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(widget.rating),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.author,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(widget.icon, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}

class LessonCardReact extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String author;
  final IconData icon;
  final VoidCallback onTap; // Add onTap callback

  const LessonCardReact({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.author,
    required this.icon,
    required this.onTap, // Accept onTap as a parameter
  });

  @override
  State<LessonCardReact> createState() => _LessonCardReactState();
}

class _LessonCardReactState extends State<LessonCardReact> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap, // Handle the tap action
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset('assets/reactlogo.png', width: 50),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.price,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text(widget.rating),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.author,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(widget.icon, color: Colors.red),
            ],
          ),
        ),
      ),
    );
  }
}
