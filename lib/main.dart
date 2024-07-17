import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'The Flutter Times';

    final List<Map<String, String>> homeEntries = [
      {
        'title': 'Home Article A',
        'content': 'Content for home article A',
        'image': 'https://plus.unsplash.com/premium_photo-1700830647950-6bba9ca2a957?q=80&w=350'
      },
      {
        'title': 'Home Article B',
        'content': 'Content for home article B',
        'image': 'https://images.unsplash.com/photo-1719937051230-8798ae2ebe86?q=80&w=350'
      },
      {
        'title': 'Home Article C',
        'content': 'Content for home article C',
        'image': 'https://images.unsplash.com/photo-1721157549677-73644a262b6c?q=80&w=350&auto=format&fit=crop'
      },
    ];

    final List<Map<String, String>> businessEntries = [
      {
        'title': 'Business Article A',
        'content': 'Content for business article A',
        'image': 'https://images.unsplash.com/photo-1718968053609-2ebb48c56421?q=80&w=350&auto=format&fit=crop'
      },
      {
        'title': 'Business Article B',
        'content': 'Content for business article B',
        'image': 'https://images.unsplash.com/photo-1720887236665-43caad593cdf?q=80&w=350&auto=format&fit=crop'
      },
      {
        'title': 'Business Article C',
        'content': 'Content for business article C',
        'image': 'https://images.unsplash.com/photo-1720983590448-28b749bd403d?q=80&w=350&auto=format&fit=crop'
      },
    ];

    final List<Map<String, String>> technologyEntries = [
      {
        'title': 'Technology Article A',
        'content': 'Content for technology article A',
        'image': 'https://images.unsplash.com/photo-1721069209963-f47e9ae0af56?q=80&w=350'
      },
      {
        'title': 'Technology Article B',
        'content': 'Content for technology article B',
        'image': 'https://images.unsplash.com/photo-1720048170970-3848514c3d60?q=80&w=350&auto=format&fit=crop'
      },
      {
        'title': 'Technology Article C',
        'content': 'Content for technology article C',
        'image': 'https://images.unsplash.com/photo-1721069210030-4e60fa75e70d?q=80&w=350&auto=format&fit=crop'
      },
    ];

    return MaterialApp(
      title: appTitle,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              appTitle,
              style: GoogleFonts.robotoSerif(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.white,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Home'),
                Tab(text: 'Business'),
                Tab(text: 'Technology'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              buildListView(context, homeEntries),
              buildListView(context, businessEntries),
              buildListView(context, technologyEntries),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context, List<Map<String, String>> entries) {
    return ListView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ArticleDetails(
                  title: entries[index]['title']!,
                  content: entries[index]['content']!,
                  image: entries[index]['image']!,
                ),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  entries[index]['image']!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entries[index]['title']!,
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        entries[index]['content']!,
                        overflow: TextOverflow.fade,
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArticleDetails extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const ArticleDetails({
    super.key,
    required this.title,
    required this.content,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: GoogleFonts.robotoSerif(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // Same color as the main appBar
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                content,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
