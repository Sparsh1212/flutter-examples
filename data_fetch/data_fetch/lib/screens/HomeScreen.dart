import 'package:data_fetch/models/Album.dart';
import 'package:data_fetch/services/ApiService.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Data fetching app'),
      ),
      body: Center(
        child: FutureBuilder<List<Album>>(
          future: fetchAlbums(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Album> albumList = snapshot.data!;
              return ListView.builder(
                  itemCount: albumList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                        title: Text(
                      albumList[index].title,
                    ));
                  });
            } else if (snapshot.hasError) {
              return Text('Error fetching list');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
