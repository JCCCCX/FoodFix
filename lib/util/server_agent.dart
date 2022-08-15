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
  static const webServerMenu = '$webServerBase/menu';
  static const webServerOrder = '$webServerBase/order';
  static const webServerOrderDaily = '$webServerBase/order/daily';
  static const webServerOrderMe = '$webServerBase/order/me';

  static void initialize(String myUserId) {
    myUserId = myUserId;
  }

  static Future<dynamic> signIn(String email, String password) async {
    User me;
    String errorMsg;

    try {
      me = User(id: '1234567890', name: 'test', roleId: '1', roleName: 'chef');
      return me;
    } on Exception catch (e) {
      errorMsg = e.toString();
      return errorMsg;
    }
  }

  static Future<Menu> getMenu(String date) async {
    Menu menu;
    String webServerMenuToday = '${ServerAgent.webServerMenu}/$date';

    logD('--------curl: $webServerMenuToday');
    var response = await Dio().get(webServerMenuToday);
    logD('--------response: $response');
    if (response.statusCode == 200) {
      var responseData = response.data;
      String breakfast = responseData['breakfast'];
      String lunch = responseData['lunch'];
      String dinner = responseData['dinner'];
      menu =
          Menu(breakfast: breakfast, lunch: lunch, dinner: dinner, date: date);
    } else {
      logE('xxx response error: $response');
      menu = Menu(
          breakfast: 'no data',
          lunch: 'no data',
          dinner: 'no data',
          date: date);
    }
    return menu;
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
