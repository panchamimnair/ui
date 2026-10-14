import 'package:flutter/material.dart';
import 'package:practice/ui14-10-26.dart';

class SavedBlogsScreen extends StatefulWidget {
  final List<Map<String, dynamic>> blogs;
  final ValueChanged<Map<String, dynamic>> onToggle;

  const SavedBlogsScreen({
    super.key,
    required this.blogs,
    required this.onToggle,
  });

  @override
  State<SavedBlogsScreen> createState() => _SavedBlogsScreenState();
}

class _SavedBlogsScreenState extends State<SavedBlogsScreen> {
  @override
  Widget build(BuildContext context) {
    final savedBlogs = widget.blogs
        .where((blog) => blog['isSaved'] == true)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Blogs'),
      ),
      body: savedBlogs.isEmpty
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.bookmarks_outlined,
                    size: 70,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No saved blogs yet!',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text('Tap the bookmark icon to save a blog.'),
                ],
              ),
            )
          : ListView.builder(
              itemCount: savedBlogs.length,
              itemBuilder: (context, index) {
                final blog = savedBlogs[index];

                return BlogCard(
                  blog: blog,
                  onBookmarkTap: () {
                    widget.onToggle(blog);
                    setState(() {});
                  },
                );
              },
            ),
    );
  }
}
