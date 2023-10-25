import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widgets/post_field.dart';
import 'widgets/post_data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forum App'),
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostField(
              hintText: 'What do you want to ask?',
              controller: _postController,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                elevation: 0,
                padding: EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 10,
                ),
              ),
              onPressed: () {},
              child: Text('Post'),
            ),
            SizedBox(height: 30),
            Text('Post'),
            SizedBox(height: 20),
            PostData(),
            PostData(),
          ],
        ),
      ),
    );
  }
}
