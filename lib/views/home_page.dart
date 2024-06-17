import 'package:flutter/material.dart';
import 'package:gsm_inside_flutter/apis/fetch_api.dart';
import 'package:gsm_inside_flutter/models/api_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ApiModel> fetchedData = [];

  getFatchApi() async {
    List<ApiModel> data = await FetchApi().getFetchApi();
    setState(
      () {
        fetchedData = data;
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getFatchApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: fetchedData.isEmpty == true
          ? const SizedBox()
          : ListView.builder(
              itemCount: fetchedData.length,
              itemBuilder: (context, value) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('아이디 : ${fetchedData[value].id}'),
                    Text('날짜 : ${fetchedData[value].date}'),
                    Text('제목 : ${fetchedData[value].title}'),
                    Text('내용 : ${fetchedData[value].content}'),
                  ],
                ),
              ),
            ),
    );
  }
}
