import 'dart:convert';

import 'package:http/http.dart' as http;

class cashFreeToken{
  getToken(String orderId,int amount) async{
    var url="https://api.cashfree.com/api/v2/cftoken/order";
    var headers={
      'Content-Type': 'application/json',
      'x-client-id': '57663ad830b5854b39d3205f136675',
      'x-client-secret': '09da51745445ea39908333abbc10112f1b601fc0'
    };
    var body=jsonEncode({
      "orderId": orderId,
      "orderAmount":amount,
      "orderCurrency": "INR"
    });
    var tokenData=await http.post(url,headers: headers,body: body);
    var response=jsonDecode(tokenData.body);
    print(response);
    return response['cftoken'];
}
}