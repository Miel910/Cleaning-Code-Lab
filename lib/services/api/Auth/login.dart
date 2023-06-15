import 'dart:convert';
import 'dart:io';
import 'package:app_api/services/api/api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> login({required Map body}) async {
  try {
    var url = Uri.http(Api().url, Api().login);
    var response = await http.post(url, body: json.encode(body));

    return response;
  } on HttpException catch (error) {
    return Response(error.message, 111);
  } on ArgumentError catch (error) {
    return Response(error.message, 111);
  } on ClientException catch (error) {
    return Response(error.message, 111);
  } catch (error) {
    return Response("error", 111);
  }
}
