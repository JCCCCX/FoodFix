import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:foodfix/entity/menu.dart';
import 'package:foodfix/entity/sandwich_order.dart';
import 'package:foodfix/entity/user.dart';
import 'package:foodfix/util/date_util.dart';
import 'package:foodfix/util/log_util.dart';

class ServerAgent {
  static const serverHost = 'app.foodfix.info';
  static const apiVersion = 'v1/api';
  static const webServerBase = 'http://$serverHost/$apiVersion';
  static const apiUrlLogin = '$webServerBase/login';
  static const apiUrlMenu = '$webServerBase/menu';
  static const apiUrlOrder = '$webServerBase/order';
  static const apiUrlOrderDaily = '$webServerBase/order/daily';
  static const apiUrlOrderMe = '$webServerBase/order/me';
  static const apiUrlComponent = '$webServerBase/component';

  static void initialize(String myUserId) {
    myUserId = myUserId;
  }

  static Future<String> doLogin(String email, String password) async {
    String sessionId = '';
    String url = ServerAgent.apiUrlLogin;
    var postData = {"email": email, "password": password};
    try {
      var response = await Dio().post(url, data: postData);
      if (response.statusCode == 200) {
        var responseData = response.data['data'];
        sessionId = responseData['sessionId'];
      } else {
        logE('response error: $response');
      }
    } on DioError catch (e) {
      logE('login error: $e');
    }
    return sessionId;
  }

  static Future<String> checkLogin(String sessionId) async {
    String role = 'unkown';
    String url = ServerAgent.apiUrlLogin;
    Map<String, dynamic> headers = {"X-Session-Id": sessionId};
    try {
      var response = await Dio().get(url, options: Options(headers: headers));
      if (response.statusCode == 200) {
        logD('--- response: $response');
        var responseData = response.data['data'];
        role = responseData['category'];
      } else {
        logE('response error: $response');
      }
    } on DioError catch (e) {
      logE('server access error: $e');
    }
    return role;
  }

  static Future<Menu> getMenu(String date) async {
    Menu menu = Menu();
    String url = '${ServerAgent.apiUrlMenu}/$date';
    logD('--------curl: $url');

    try {
      var response = await Dio().get(url);
      logD('--------response: $response');
      if (response.statusCode == 200) {
        var responseData = response.data;
        String breakfast = responseData['breakfast'] ?? 'not published';
        String lunch = responseData['lunch'] ?? 'not published';
        String dinner = responseData['dinner'] ?? 'not published';
        menu = Menu(
            breakfast: breakfast, lunch: lunch, dinner: dinner, date: date);
      } else {
        logE('response error: $response');
      }
    } on DioError catch (e) {
      logE('server access error: $e');
    }
    return menu;
  }

  static Future<int> getSandwichOrderTotalCount(String date) async {
    int total = 0;
    String url = '${ServerAgent.apiUrlOrderDaily}?&date=$date&page=0&size=5';
    logD('--------curl: $url');

    try {
      var response = await Dio().get(url);
      logD('--------response: $response');
      if (response.statusCode == 200) {
        var responseData = response.data;
        List orderedList = responseData['Ordered'] ?? [];
        List makingList = responseData['Making'] ?? [];
        List completedList = responseData['Completed'] ?? [];
        List canceledList = responseData['Canceled'] ?? [];
        List takenList = responseData['Taken'] ?? [];
        total = orderedList.length +
            makingList.length +
            completedList.length +
            canceledList.length +
            takenList.length;
      } else {
        logE('response error: $response');
      }
    } on DioError catch (e) {
      logE('server access error: $e');
    }
    return total;
  }

  static Future<bool> finishOrder(postData) async {
    // update order status to database

    // print sticker ???

    return true;
  }

  static Future<List<SandwichOrder>> getSandwichOrdersToDo(postData) async {
    List<SandwichOrder> todoList = <SandwichOrder>[];

    // var response = await Dio()
    //     .get(ServerAgent.webServerOrderDaily, queryParameters: postData);
    // if (response.statusCode == 200) {
    //   var responseData = jsonDecode(response.data!);
    //   // print('---------------------responseData: $responseData');
    //   for (var obj in responseData) {
    //     // logD('---------------------obj: $obj');
    //     String orderId = obj['orderId'];
    //     // SandwichOrder order = SandwichOrder(
    //     //     orderNo: 201,
    //     //     studentId: 2022231,
    //     //     studentName: 'Jason Cheng',
    //     //     breadName: 'Grain wheat',
    //     //     meatName: 'Ham turkey',
    //     //     cheeseName: 'American style',
    //     //     vegetableNames: ['onion', 'lettuce', 'pickle'],
    //     //     sauceName: 'BBQ');
    //     // todoList.add(order);
    //   }
    // }

    SandwichOrder order;
    order = SandwichOrder(
        orderNo: 201,
        studentId: 2022231,
        studentName: 'Jason Cheng',
        breadId: '1001',
        breadName: 'Grain wheat',
        meatId: '2001',
        meatName: 'Ham',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: ['4001', '4002', '4003'],
        vegetableNames: ['Onion', 'Lettuce', 'Tomato'],
        sauceId: '5001',
        sauceName: 'BBQ');
    todoList.add(order);

    order = SandwichOrder(
        orderNo: 202,
        studentId: 2022232,
        studentName: 'Carson Ling',
        breadId: '1002',
        breadName: 'Italian',
        meatId: '2002',
        meatName: 'Chicken',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: [
          '4001',
          '4002',
        ],
        vegetableNames: [
          'Onion',
          'Lettuce',
        ],
        sauceId: '5002',
        sauceName: 'Ketchup');
    todoList.add(order);

    order = SandwichOrder(
        orderNo: 203,
        studentId: 2022233,
        studentName: 'Grace Ding',
        breadId: '1001',
        breadName: 'Grain wheat',
        meatId: '2001',
        meatName: 'Ham',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: ['4001', '4003'],
        vegetableNames: ['Onion', 'Pickle'],
        sauceId: '5001',
        sauceName: 'BBQ');
    todoList.add(order);

    order = SandwichOrder(
        orderNo: 204,
        studentId: 2022233,
        studentName: 'Kyle Chen',
        breadId: '1002',
        breadName: 'Italian',
        meatId: '2001',
        meatName: 'Ham',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: ['4001', '4002', '4003'],
        vegetableNames: ['Onion', 'Lettuce', 'Tomato'],
        sauceId: '5001',
        sauceName: 'BBQ');
    todoList.add(order);

    order = SandwichOrder(
        orderNo: 205,
        studentId: 2022233,
        studentName: 'Stephen Yang',
        breadId: '1001',
        breadName: 'Grain wheat',
        meatId: '2001',
        meatName: 'Ham turkey',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: ['4001', '4002', '4003'],
        vegetableNames: ['Onion', 'Lettuce', 'Tomato'],
        sauceId: '5001',
        sauceName: 'BBQ');
    todoList.add(order);

    order = SandwichOrder(
        orderNo: 206,
        studentId: 2022233,
        studentName: 'Shuyang Chen',
        breadId: '1001',
        breadName: 'Grain wheat',
        meatId: '2002',
        meatName: 'Chicken',
        cheeseId: '3001',
        cheeseName: 'American style',
        vegetableIds: ['4002', '4003'],
        vegetableNames: ['Lettuce', 'Tomato'],
        sauceId: '5002',
        sauceName: 'Ketchup');
    todoList.add(order);
    return todoList;
  }
}
