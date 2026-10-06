import 'package:http/http.dart' as http;

import '../database/database_paths.dart';

class ApiCaller {

  static Future<void> pushRequest(String url)async {
    http.get(Uri.parse('${url}'));
  }


}