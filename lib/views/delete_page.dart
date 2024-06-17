import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/apis/fetch_api.dart';

class DeletePage extends StatefulWidget {
  const DeletePage({super.key});

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final TextEditingController _idController = TextEditingController();
  deleteFetchApi() async {
    await FetchApi().deleteFetchApi(_idController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _idController,
          ),
          ElevatedButton(onPressed: deleteFetchApi, child: const Text("delete"))
        ],
      ),
    );
  }
}
