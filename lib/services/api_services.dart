import 'dart:convert';
import '/_helpers/config/config.dart';
import 'package:http/http.dart' as http;
import 'package:validators/sanitizers.dart';

class ApiSrvices {
  final String base = baseUrl;
  Map<String, dynamic> headers = {
    "Content-type": "application/json",
  };

  Uri getUri(String path, Map<String, dynamic> params) {
    String query = "";

    if (params.isNotEmpty) {
      query = "?";
      params.forEach((key, value) {
        query += "$key=${value.toString()}&";
      });
    }
    path = rtrim(path, "/");
    path = ltrim(path, "/");
    query = rtrim(query, "&");

    final url = "$base/$path/$query";
    return Uri.parse(url);
  }

  Future<Map<String, dynamic>> httpGet(
      String path, Map<String, dynamic> params) async {
    final url = getUri(path, params);

    final response = await http.get(url);
    if (response.bodyBytes.isNotEmpty && response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }

  Future<dynamic> httpPost(String path, Map<String, dynamic> body,
      Map<String, dynamic> header) async {
    final url = Uri.parse(base + path);
    headers.addEntries(headers.entries);

    final response = await http.post(url, body: body);

    if (response.bodyBytes.isNotEmpty && response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    }
    return {};
  }
}
