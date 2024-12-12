
import 'dart:convert';

import 'package:http/http.dart' as http;

class ParkersMovers{
final String _url = 'https://shelterplug.com/api/';

postData(data, apiUrl) async {
  var fullUrl = _url+apiUrl;
  return await http.post(
    Uri.parse(fullUrl),
    body: json.encode(data),
    headers: _setHeaders(),
  );
}

_setHeaders()=>{
  'Content-type':'application/json',
  'Accept' : 'application/json',
};
}