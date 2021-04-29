import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

 String api = "http://10.0.2.2:7001/rest";
//String api= "http://134.209.147.13:7001/rest";

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();
  return directory.path;
}

Future<String> getProfilePhoto() async {
  String url = '$api/imageProfile/getOneById';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) =>
  {e = jsonDecode(value)["user"]["id"],
  });
  String json = '{"userid":"$e"}';
  var response = await http.post(url, headers: headers, body: json);
  print(response.body);
  Uint8List bytes = base64.decode(response.body);
  print(bytes);
}

Future<int> removeFromCart(int c) async{
  String url = '$api/cart/deleteOne';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"]});
  String json =
      '{"prodid":"$c","userid":"$e"}';
  var response = await http.post(url, headers: headers, body: json);
  String body = response.body;
  if (jsonDecode(body)["success"] == true) {
    return 1;
  } else {
    return 0;
  }
}

Future<void> writeToFile(var data) {
  final buffer = data.buffer;
  return new File('assets/file/').writeAsBytes(
      buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
}

Future<String> uploadPhoto(var file) async{
  String url = '$api/images/createOne';
  var request = http.MultipartRequest('POST', Uri.parse(url));
  try {
    request.files.add(
        http.MultipartFile(
            'picture',
            file.readAsBytes().asStream(),
            file.lengthSync(),
            filename: file.path
        )
    );
  } catch (e, s) {
    print(s);
  }
  var id=-1;
  request.fields['key'] = 'value';
  var res = await request.send();
  var responseData = await res.stream.toBytes();
  var responseString = String.fromCharCodes(responseData);
  return responseString;
}

Future<String> uploadProfilePhoto(var id) async{
  String url = '$api/imageProfile/createOne';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"],
  });
  String json = '{"imageid":"${jsonDecode(id)["id"]}","userid":"$e"}';
  var response = await http.post(url, headers: headers, body: json);
  return response.body;
}


Future<String> getCart() async{
  String url = '$api/cart/getOneById';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"]});
  String json = '{"id": "$e"}';
  json = json.replaceAll(' ', '');
  var response = await http.post(url, headers: headers, body: json);
  return response.body;
}

Future<int> addToCart(String a,int b,int c,String d) async{
  String url = '$api/cart/createone';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"]});
  String json =
      '{"name":"$a","price": "$b","prodid":"$c","type":"$d","userid":"$e"}';
  var response = await http.post(url, headers: headers, body: json);
  String body = response.body;
  if (jsonDecode(body)["success"] == true) {
    return 1;
  } else {
    return 0;
  }
}

Future<int> regUser(String a, String b, String c, String d) async {
  String url = '$api/users/createone';
  Map<String, String> headers = {"Content-type": "application/json"};
  b = b.replaceAll(' ', '');
  String json = '{"name":"$a","email": "$b","pass":"$c","contactNumber":"$d"}';
  var response = await http.post(url, headers: headers, body: json);
  String body = response.body;
  String data='{"user":{"status":200,"name":"$a","email":"$b","contactNumber":"$d"}}';
  if (jsonDecode(body)["success"] == true) {
    await writeContent(body, 2);
    print(body);
    return 1;
  } else {
    print(body);
    return 0;
  }
}

Future<File> get _localFile async {
  final path = await _localPath;
  return File('$path');
}

Future<File> getLocation(int data) async {
  var file = await _localFile;
  if (data == 1) {
    file = File(file.path + '/data.txt');
    return file;
  } else if (data == 2) {
    file = File(file.path + '/login.txt');
    return file;
  }
}

Future<String> getProdById(int a) async {
  String url = '$api/products/getOneById';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"id": "$a"}';
  json = json.replaceAll(' ', '');
  var response = await http.post(url, headers: headers, body: json);
  return response.body;
}

Future<List> getProdByCategory(String a) async {
  String url = '$api/products/getOneCategory';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"type": "$a"}';
  json = json.replaceAll(' ', '');
  var response = await http.post(url, headers: headers, body: json);
  return jsonDecode(response.body)["product"];
}

Future<String> getUser(int a) async {
  String url = '$api/users/getone';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"id": "$a"}';
  json = json.replaceAll(' ', '');
  var response = await http.post(url, headers: headers, body: json);
  return response.body;
}

Future<String> loginUser(String a, String b) async {
  String url = '$api/users/login';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"email": "$a","pass":"$b"}';
  json = json.replaceAll(' ', '');
  var response = await http.post(url, headers: headers, body: json);
  return response.body;
}

Future<int> registerprod(String a, String b, String c, String d,String f) async {
  String url = '$api/products/createone';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"]});
  String json =
      '{"name":"$a","price": "$b","desc":"$c","type":"$d","userid":"$e","imageid":"${jsonDecode(f)["id"]}"}';
  print(json);
  var response = await http.post(url, headers: headers, body: json);
  String body = response.body;
  if (jsonDecode(body)["success"] == true) {
    return 1;
  } else {
    print(response.body);
    return 0;
  }
}

Future<File> writeContent(String temp, int data) async {
  File file = await getLocation(data);
  return file.writeAsString(temp);
}

Future<String> readcontent(int temp) async {
  try {
    final file = await getLocation(temp);
    String contents = await file.readAsString();
    return contents;
  } catch (e) {
    return 'Error';
  }
}

Future<String> fetchUser() async {
  return await readcontent(2);
}

Future<List> getallprod() async {
  String url = '$api/products/getAll';
  var response = await http.get(url);
  String body = response.body;
  if (response.statusCode == 200) {
    data = json.decode(response.body);
    data = data["products"] as List;
    return data;
  }
}

Future<String> getprod() async {
  String url = '$api/products/getAllUser';
  Map<String, String> headers = {"Content-type": "application/json"};
  int e;
  await fetchUser().then((value) => {e = jsonDecode(value)["user"]["id"]});
  var response = await http.post(url, headers: headers, body: '{"id":"$e"}');
  String body = response.body;
  if (jsonDecode(body)["success"] == true) {
    return body;
  } else {
    return 'Error';
  }
}

var data;

Future<Post> fetchPost() async {
  final response = await http.get('$api/institutes/getAll');
//  await http.get('http://10.0.2.2:7001/rest/institutes/getAll');
  if (response.statusCode == 200) {
    data = json.decode(response.body);
    data = data["institutes"] as List;
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class Post {
  final List temp;
  Post({this.temp});
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      temp: data,
    );
  }
}

Future<List> getlocationdata() async {
  http.Response response = await http.get(Uri.parse("$api/locations/all"),
      headers: {"Accept": "application/json"});
  var data = json.decode(response.body);
  data = data["locations"] as List;
  return data;
}

Future<List> getinstitutesdata() async {
  http.Response response = await http.get(
    Uri.parse("$api/institutes/all"),
  );
  var data = json.decode(response.body);
  data = data["institutes"] as List;
  if (data != null) return data;
}

Future<List> getinstitutesbyid(int id) async {
  http.Response response = await http.get(
      Uri.encodeFull("$api/institutes/id/$id"),
      headers: {"Accept": "application/json"});
  var data = json.decode(response.body);
  data = data["institutes"] as List;
  return data;
}

Future<List> getteachersbyid(int id) async {
  String url = '$api/instituteTeacher/getByInstitute';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"instituteId":$id}';
  http.Response response = await http.post(url, headers: headers, body: json);
  List<dynamic> body = jsonDecode(response.body)["instituteTeachers"];
  return body;
}

Future<List> getaddressbyid(int id) async {
  String url = '$api/instituteAddress/getByInstitute';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"instituteId":$id}';
  http.Response response = await http.post(url, headers: headers, body: json);
  List<dynamic> body = jsonDecode(response.body)["instituteAddresses"];
  List list = new List();
  for (var i = 0; i < body.length; i++) {
    list.add({
      "location": await getlocationbyid(body[i]["locationId"]),
      "address": body[i]
    });
  }
  return list;
}

Future<Map> getlocationbyid(int id) async {
  http.Response response = await http.get(
      Uri.encodeFull("$api/locations/getOneById/$id"),
      headers: {"Accept": "application/json"});
  Map<String, dynamic> body = jsonDecode(response.body)["location"];
  return body;
}

Future<List> getcontactbyid(int id) async {
  String url = '$api/instituteContact/getByInstitute';
  Map<String, String> headers = {"Content-type": "application/json"};
  String json = '{"instituteId":$id}';
  http.Response response = await http.post(url, headers: headers, body: json);
  List<dynamic> body = jsonDecode(response.body)["instituteContacts"];
  return body;
}
