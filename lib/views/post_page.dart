import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/apis/fetch_api.dart';
import 'package:gsm_inside_flutter/models/api_model.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _idController = TextEditingController();

  postFetchApi() async {
    await FetchApi.postFetchApi(
      ApiModel(title: _titleController.text, content: _contentController.text)
          .toJson(),
    );
  }

  putFetchApi() async {
    await FetchApi.putFetchApi(
        ApiModel(title: _titleController.text, content: _contentController.text)
            .toJson(),
        _idController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(hintText: 'title'),
            ),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(hintText: 'content'),
            ),
            ElevatedButton(
              onPressed: postFetchApi,
              child: Container(
                decoration: const BoxDecoration(),
                child: const Text('post'),
              ),
            ),
            TextField(
              controller: _idController,
              decoration: const InputDecoration(hintText: 'id(Put 전용 )'),
            ),
            ElevatedButton(
              onPressed: putFetchApi,
              child: Container(
                decoration: const BoxDecoration(),
                child: const Text('put'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
