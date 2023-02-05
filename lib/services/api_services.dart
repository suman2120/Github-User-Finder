import 'dart:convert';

import 'package:api2/models/github_user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = "https://api.github.com/users/";
  static const apiToken = "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";
  Future<GitHubUser> getGithubUserData(String userName) async {
    try {
      var response = await http.get(Uri.parse(baseUrl + userName), headers: {
        'Authorization': "Bearer $apiToken"

      });

    print(response.headers);
      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        //print(jsonData);
        print(jsonData);

        return GitHubUser.fromJson(jsonData);
      }
      return GitHubUser();
    } catch (e) {
      print(e.toString());
      return GitHubUser();
    }
  }
}
