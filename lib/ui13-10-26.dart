
import 'package:flutter/material.dart';

class Flutterblog extends StatefulWidget {
  const Flutterblog({super.key});

  @override
  State<Flutterblog> createState() => _FlutterblogState();
}

class _FlutterblogState extends State<Flutterblog> {
  List<Map<String, dynamic>> Blog = [
    {
      'name': 'Getting Started with Flutter',
      'blog': 'Learning Flutter with basics',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrazbKdcMVOGieJP88Xh2iVZXREyHe821KFM4BiA-m9mn2eFZGlmOKh4-B&s=10',
      'time': '3 min read',
      'Date':'may20 2024'
    },
    {
      'name': 'Understanding widgets',
      'blog': 'Everything you know about widgets in flutter',
      'image':
          'https://www.xenonstack.com/hubfs/flutter-widgets-list.png',
      'time': '7 min read',
      'Date':'may 15 2024'
    },
    {
      'name': 'State management in flutter',
      'blog': 'Explore the different statemanagement tools in flutter',
      'image':
          'https://miro.medium.com/1*Nsl_PJZNuUVIJv19CTIwhA.png',
      'time': '3 days ago',
      'Date':'may20 2024'
    },
    {
      'name': 'Firebase Integration Guide',
      'blog': 'step by step guide to integrate firebase on your flutter application',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4_1c3c-JWUX7QghFlxBYK2ELzc72-BO5JYNAOafBo1dijVTUibdv84A7e&s=10',
      'time': '8 min read',
      'Date':'may22 2024'
    },
    {
      'name': 'Flutter ui design tips',
      'blog': 'simple tips to make your flutter app modern and beautiful',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSh6w-qsRGhXoetHKzIkwgSaqkVzbpolOMiRqXHTH1yw&s',
      'time': '3 days ago',
      'Date':'may20 2024'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Flutter Blog'),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: Blog.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 8,
            shadowColor: Colors.blue,
            color: Colors.white,
            margin: const EdgeInsets.all(10),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              title: Text(
                Blog[index]['name'],
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(Blog[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Blog[index]['blog'],
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      
                      children: [
                        Text(
                          Blog[index]['Date'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                        Spacer(),
                        Text(
                          Blog[index]['time'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        )

                      ],
                    ),
                  ],
                ),
              ),
              trailing:const Icon(
                Icons.bookmark_border,
                color: Colors.blueGrey,
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
