import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/queries.dart';
import '../model/product_model.dart';
part 'product_services.g.dart';  // Add this line to include the generated file

@RestApi(baseUrl: baseUrl)
abstract class ProductServices {
  factory ProductServices(Dio dio, {String? baseUrl}) = _ProductServices; // This will be auto-generated

  @GET('/products')
  Future<HttpResponse<List<ProductModel>>> getProducts();
}
