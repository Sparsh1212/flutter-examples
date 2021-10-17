import 'dart:convert';

import 'package:data_fetch/models/Album.dart';
import 'package:http/http.dart' as http;

Future<List<Album>> fetchAlbums() async {
  try {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data.map<Album>((album) => Album.fromJson(album)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  } catch (e) {
    throw Exception('Error fetching data');
  }
}
