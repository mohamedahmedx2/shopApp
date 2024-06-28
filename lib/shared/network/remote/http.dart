// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../end_points.dart';
// class API {
//
//  static Future userLogin({data,Uri}) async {
//     try {
//       http.Response response = await http.post(
//         loginUrl,
//         body: json.encode(
//           {
//             data : data,
//             Uri : ''
//           },
//         ),
//         headers: {
//           'lang': 'ar',
//           'Content-Type': 'application/json',
//         },
//       );
//       return jsonDecode(response.body);
//     } catch (error) {
//       print(error.toString());
//     }
//   }
//
//
//
//   // Future getData({
//   //   required String url,
//   //   required Map<String, String> data,
//   // }) async
//   //
//   // {
//   //   var url = 'https://student.valuxapps.com/api/';
//   //   var response = await http.get(Uri(path: url));
//   //   var responseBody = jsonDecode(response.body);
//   //   print(responseBody);
//   // }
//
// }