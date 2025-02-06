import 'package:flutter/material.dart';

import 'package:course_app/overview2.dart';

void main() {
  runApp(const MyCourses());
}

class MyCourses extends StatefulWidget {
  const MyCourses({Key? key}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCoursesPage(),
    );
  }
}

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Favourite',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
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
              LessonCardReact(
                title: 'React',
                description: 'Description: All can be perfect in React...',
                price: '\$45',
                rating: '5.0',
                author: 'by Hanad Beginner',
                icon: Icons.favorite_border,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const overview2(),
                    ),
                  );
                },
              ),
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
