import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/views/delete_page.dart';
import 'package:gsm_inside_flutter/views/home_page.dart';
import 'package:gsm_inside_flutter/views/post_page.dart';

class SelectPage extends StatelessWidget {
  const SelectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostPage(),
                ),
              ),
              child: const Text('postPage'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              ),
              child: const Text('getPage'),
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DeletePage(),
                ),
              ),
              child: const Text('deletePage'),
            )
          ],
        ),
      ),
    );
  }
}
