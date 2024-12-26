import 'apikey.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {

  Future getRates(String base, String quote) async{
    String apiUrl = 'https://rest.coinapi.io/v1/exchangerate/$base/$quote';

    try{
      var url = await Uri.parse(apiUrl);
      var response = await http.get(
          url,
          headers: {
            "Accept": "text/json",
            "X-CoinAPI-Key": "57898523-2C18-4AD3-B923-B235B5EF019F"
          });


      if(response.statusCode == 200){
        var jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      }else{
        print('Error: ${response.statusCode}');
        return 0;
      }
    }catch(e){
      print("Error::: $e");
    }



  }
}
