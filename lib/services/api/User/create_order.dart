import 'dart:convert';
import 'dart:io';
import 'package:app_api/extensions/navigators.dart';
import 'package:app_api/services/api/api.dart';
import 'package:app_api/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> createOrder(
    {required Map body, required BuildContext context}) async {
  try {
    final box = GetStorage();
    var url = Uri.http(Api().url, Api().createOrder);
    var response = await http.post(url,
        body: json.encode(body), headers: {"authorization": box.read("token")});
    if (response.statusCode == 401) {
      box.remove("token");

      context.pushAndRemove(screen: LoginScreen());
    }
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
