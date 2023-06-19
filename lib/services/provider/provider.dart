import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../../model/model/busmodel.dart';
import '../../model/model/drivermodel.dart';
import '../utils/api.dart';

class Auth with ChangeNotifier {
  final MainUrl = Api.authUrl;


  String? _token;
  String? _userId;

  String? _userEmail;
  DateTime? _expiryDate;
  Timer? _authTimer;
  Drivers? drivers;
  Buses? buses;
  bool _isLoading = false;


  Future<void> login(BuildContext context, String username,
      String password) async {
    final url = '$MainUrl/LoginApi';
    print(url);
    try {
      if (username == 'admin_user' && password == '123admin789') {
        var response = await http.post(Uri.parse(url), body: {
          'username': username,
          'password': password,
        });

        if (response.statusCode == 200) {
          var responseBody = response.body;
          var jsonResponse = json.decode(responseBody);
          print(url);
          _token = jsonResponse['access_token'];

          print(_token);


          Navigator.pushReplacementNamed(context, '/home');
        } else {
          Fluttertoast.showToast(msg: 'Login Failed...Please try Again');
        }
      } else {
        Fluttertoast.showToast(msg: 'No User Found :(');
      }
    } catch (e) {
      // Exception occurred
      print('Exception occurred during login: $e');
      // Handle the exception
    }
  }


  Future<Drivers> getDriver() async {
    var client = http.Client();
    var uri = '$MainUrl/DriverApi';
    print(uri);
    var url = Uri.parse(uri);
    try {
      var response = await client.get(url,
        headers: {
          'Authorization': 'Bearer $_token', // Add your desired headers here
          'Content-Type': 'application/json',
        },);
      if (response.statusCode == 200) {
        var json = response.body;
        return driversFromJson(json);
      } else {
        // Handle other status codes or specific error cases
        throw Exception('Failed to fetch cat data');
      }
    } catch (error) {
      // Handle network or other general errors
      throw Exception('Error: $error');
    } finally {
      client.close(); // Close the client to release resources
    }
  }

  Future<void> fetchDrivers() async {
    _isLoading = true;
    notifyListeners();

    try {
      drivers = await getDriver();
    } catch (error) {
      print('Error: $error');
    }

    _isLoading = false;
    notifyListeners();
  }












  Future<Buses> getbus() async {
    var client = http.Client();
    var uri ='$MainUrl/BusListApi';
    print(uri);
    var url = Uri.parse(uri);
    try {
      var response = await client.get(url,
        headers: {
          'Authorization': 'Bearer $_token', // Add your desired headers here
          'Content-Type': 'application/json',
        },);
      if (response.statusCode == 200) {
        var json = response.body;
        return busesFromJson(json);
      } else {
        // Handle other status codes or specific error cases
        throw Exception('Failed to fetch cat data');
      }
    } catch (error) {
      // Handle network or other general errors
      throw Exception('Error: $error');
    } finally {
      client.close(); // Close the client to release resources
    }
  }

  Future<void> fetchbus() async {
    _isLoading = true;
    notifyListeners();

    try {
      buses = await getbus();
    } catch (error) {
      print('Error: $error');
    }

    _isLoading = false;
    notifyListeners();
  }
























  Future<DriverList> createDriver(DriverList newDriver) async {
    var client = http.Client();
    var uri = "$MainUrl/DriverApi";
    var url = Uri.parse(uri);
    try {
      var response = await client.post(
        url,
        headers: {
          'Authorization': 'Bearer $_token',
          'Content-Type': 'application/json',
        },
        body: driverlistToJson(newDriver),
      );
      if (response.statusCode == 200) {
        var json = response.body;
        print ("added");
        return driverlistFromJson(json);

      } else {
        print('Failed to create driver');
        throw Exception('Failed to create driver');
      }
    } catch (error) {
      throw Exception('Error: $error');
    } finally {
      client.close();
    }
  }

  // Future<void> deleteDriver(String driverId) async {
  //   var uri = "$MainUrl/DriverApi";
  //
  //   final requestData = {
  //     'driver_id': driverId,
  //   };
  //
  //   final response = await http.delete(
  //     Uri.parse(uri),
  //     body: json.encode(requestData),
  //     headers: {
  //       'Authorization': 'Bearer $_token',
  //       'Content-Type': 'application/json',
  //     },
  //   );
  //
  //   if (response.statusCode == 200) {
  //     final deleteDrivers = deleteDriversFromJson(response.body);
  //       print('Driver deleted successfully');
  //       print(deleteDrivers.toJson);
  //
  //   } else {
  //     print('Failed to delete driver. Error code: ${response.statusCode}');
  //   }
  // }





}








