import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Server {
  static const url = 'https://adv.systemateka.cc/api/web/api/v1/';

  var headers = {
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiIsImp0aSI6IjNzcWxMWUxvODdsVVpVNWJxSnRyIn0.eyJpc3MiOiJodHRwczpcL1wvYXBpLmFkdmlzb3JzLmNvbSIsImF1ZCI6Imh0dHBzOlwvXC9mcm9udGVuZC5hZHZpc29ycy5jb20iLCJqdGkiOiIzc3FsTFlMbzg3bFVaVTVicUp0ciIsImlhdCI6MTYzODQ3NDUxOSwiZXhwIjoxNjQxMDY2NTE5LCJ1aWQiOjIxfQ.OI3smMuNh4KWa3bYSOA6XxoTocieXvl35ileWbwKm-8',
    'Content-Type': 'application/json',
  };

  request(path, {req = 'GET'}) => ((http.Request(req, Uri.parse('$url$path')))..headers.addAll(headers));

  Future search({required String query, required BuildContext c}) async => await json
      .decode((await (await ((request('questions/search?offset=0&fromItemId=0&query=$query'))).send()).stream.bytesToString()).toString());
}
