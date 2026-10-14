import 'package:flutter/material.dart';
import 'package:practice/saved.dart';

class Flutterblog1 extends StatefulWidget {
  const Flutterblog1({super.key});

  @override
  State<Flutterblog1> createState() => _FlutterblogState();
}

class _FlutterblogState extends State<Flutterblog1> {
  final List<Map<String, dynamic>> Blog = [
    {
      'name': 'Getting Started with Flutter',
      'blog': 'Learning Flutter with basics',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrazbKdcMVOGieJP88Xh2iVZXREyHe821KFM4BiA-m9mn2eFZGlmOKh4-B&s=10',
      'time': '3 min read',
      'Date': 'May 20, 2024',
      'isSaved': false,
    },
    {
      'name': 'Understanding widgets',
      'blog': 'Everything you know about widgets in Flutter',
      'image': 'https://www.xenonstack.com/hubfs/flutter-widgets-list.png',
      'time': '7 min read',
      'Date': 'May 15, 2024',
      'isSaved': false,
    },
    {
      'name': 'State management in Flutter',
      'blog': 'Explore the different state management tools in Flutter',
      'image': 'https://miro.medium.com/1*Nsl_PJZNuUVIJv19CTIwhA.png',
      'time': '5 min read',
      'Date': 'May 20, 2024',
      'isSaved': false,
    },
    {
      'name': 'Firebase Integration Guide',
      'blog':
          'Step-by-step guide to integrate Firebase into your Flutter application',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_1c3c-JWUX7QghFlxBYK2ELzc72-BO5JYNAOafBo1dijVTUibdv84A7e&s=10',
      'time': '8 min read',
      'Date': 'May 22, 2024',
      'isSaved': false,
    },
    {
      'name': 'Flutter UI design tips',
      'blog': 'Simple tips to make your Flutter app modern and beautiful',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSh6w-qsRGhXoetHKzIkwgSaqkVzbpolOMiRqXHTH1yw&s',
      'time': '4 min read',
      'Date': 'May 20, 2024',
      'isSaved': false,
    },
  ];

  void toggleBookmark(Map<String, dynamic> blog) {
    setState(() {
      if (blog['isSaved'] == true) {
        blog['isSaved'] = false;
      } else {
        blog['isSaved'] = true;
      }
    });
  }

  void openSavedBlogs() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            SavedBlogsScreen(blogs: Blog, onToggle: toggleBookmark),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Flutter Blog'),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmarks_outlined),
            tooltip: 'Saved Blogs',
            onPressed: openSavedBlogs,
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView.builder(
        itemCount: Blog.length,
        itemBuilder: (context, index) {
          final blog = Blog[index];

          return BlogCard(
            blog: blog,
            onBookmarkTap: () => toggleBookmark(blog),
          );
        },
      ),
    );
  }
}

// Reusable card for both screens
class BlogCard extends StatelessWidget {
  final Map<String, dynamic> blog;
  final VoidCallback onBookmarkTap;

  const BlogCard({super.key, required this.blog, required this.onBookmarkTap});

  @override
  Widget build(BuildContext context) {
    final bool isSaved = blog['isSaved'] == true;

    return Card(
      elevation: 5,
      shadowColor: Colors.blue,
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10),
        title: Text(
          blog['name'] as String,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            blog['image'],
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                blog['blog'] as String,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      blog['Date'] as String,
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                  Text(
                    blog['time'] as String,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ),
        trailing: IconButton(
          tooltip: isSaved ? 'Remove bookmark' : 'Save blog',
          onPressed: onBookmarkTap,
          icon: Icon(
            isSaved ? Icons.bookmark : Icons.bookmark_border,
            color: isSaved ? Colors.blue : Colors.blueGrey,
          ),
        ),
        isThreeLine: true,
      ),
    );
  }
}

// Separate screen for saved blogs
