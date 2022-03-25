import 'package:http/http.dart' as http;
import 'package:shopping_flutter_app/models/product.dart';


class HttpService {
  static Future<List<ProductsModel>> fetchProducts() async {
    var response =
    await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if (response.statusCode == 200) {
      print(response.body);

      var data = response.body;
      return productsModelFromJson(data);
    } else {
      var data = response.body;
      return productsModelFromJson(data);
    }
  }
}