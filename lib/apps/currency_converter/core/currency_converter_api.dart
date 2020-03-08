import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyConverterApi {
  static const String REQUEST_URL = "https://api.hgbrasil.com/finance?format=json&key=ea3cbde1";
  final String _requestURL;

  CurrencyConverterApi(this._requestURL);

  Future<dynamic> get data async {
    var httpRequest = await http.get(_requestURL);
    return json.decode(httpRequest.body);
  }
}