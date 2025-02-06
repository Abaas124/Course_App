import 'package:flutter/material.dart';
import 'package:course_app/overview1.dart';

// import 'package:course_app/home.dart';

void main() {
  runApp(const favourite());
}

class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: favouritePage(),
    );
  }
}

class favouritePage extends StatefulWidget {
  const favouritePage({super.key});

  @override
  State<favouritePage> createState() => _favouritePageState();
}

class _favouritePageState extends State<favouritePage> {
  @override
  Widget build(BuildContext context) {
    Colors.white;
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
      body: Container(
        color: Colors.white, // Change background color here
        padding: const EdgeInsets.all(16.0),
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
              LessonCard(
                title: 'Flutter',
                description: 'Description: All can be perfect in Flutter...',
                price: '\$35',
                rating: '4.3',
                author: 'by Cadani Beginner',
                icon: Icons.favorite_border,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const overview1(),
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

class LessonCard extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String rating;
  final String author;
  final IconData icon;
  final VoidCallback onTap; // Add onTap callback

  const LessonCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
    required this.author,
    required this.icon,
    required this.onTap,
    // Accept onTap as a parameter
  });

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
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
