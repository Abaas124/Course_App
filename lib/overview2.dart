import 'package:flutter/material.dart';
import 'package:course_app/home.dart';

void main() {
  runApp(const overview2());
}

class overview2 extends StatelessWidget {
  const overview2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CourseOverviewPage(),
    );
  }
}

class CourseOverviewPage extends StatelessWidget {
  const CourseOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const home()),
            );
          },
        ),
        title: const Text(
          'Courses Overview',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.red),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/reactjs_banner.png',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Flutter Master Class For Beginners',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(Icons.access_time, color: Colors.grey, size: 16),
                const SizedBox(width: 4),
                Text(
                  '20h 30min - 23 lessons',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(width: 16),
                const Icon(Icons.star, color: Colors.amber, size: 16),
                const SizedBox(width: 4),
                Text(
                  '4.3',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Lessons',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const LessonTile(
              title: 'Introduction to Flutter',
              duration: '9:48 min',
              isPlayable: true,
            ),
            const LessonTile(
              title: 'What is Flutter',
              duration: '10:20 min',
              isPlayable: true,
            ),
            const LessonTile(
              title: 'Understanding Widgets',
              duration: '15:48 min',
              isPlayable: false,
            ),
            const Spacer(),
            Row(
              children: [
                const Text(
                  '\$35',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Enroll Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LessonTile extends StatelessWidget {
  final String title;
  final String duration;
  final bool isPlayable;

  const LessonTile({
    super.key,
    required this.title,
    required this.duration,
    required this.isPlayable,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        isPlayable ? Icons.play_circle_fill : Icons.play_circle_outline,
        color: isPlayable ? Colors.blue : Colors.grey,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        duration,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey[600],
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
    );
  }
}
