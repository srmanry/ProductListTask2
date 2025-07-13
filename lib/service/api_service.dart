
import 'package:http/http.dart' as http;

class ApiService{

  Future<http.Response> getProducts()async{
    String url = "https://fakestoreapi.com/products";
    http.Response  getData = await http.get(Uri.parse(url));

    return getData;
  }

}
