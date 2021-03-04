import 'dart:convert';

import 'package:http/http.dart' as http;

List<String> name;
List<String> htmlUrl;
List<String> language;
String avatarUrl;
dynamic jsonDe;
bool noP;
Future fetchInformation(String username) async {
  name = [];
  htmlUrl = [];
  language = [];
  avatarUrl = "";
  jsonDe = "";
  noP = false;
  try {
    final response =
        await http.get('https://api.github.com/users/' + username + '/repos');
    if (response.statusCode == 200) {
      jsonDe = jsonDecode(response.body);
      avatarUrl = jsonDe[0]['owner']['avatar_url'];
      for (var js in jsonDe) {
        name.add(js['name'].toString());
        htmlUrl.add(js['htmlUrl'].toString());
        language.add(js['language'].toString());
      }
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}
