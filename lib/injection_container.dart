import 'package:dio/dio.dart';
import 'package:fe_nike/features/home/products/data/data_sources/product_services.dart';
import 'package:fe_nike/features/home/products/data/responsitory/product_repository_imp.dart';
import 'package:fe_nike/features/home/products/domain/responsitory/product_repository.dart';
import 'package:fe_nike/features/home/products/domain/usecases/get_product.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;
Future<void> setupLocator ()async{
  // Dio
  locator.registerSingleton<Dio>(Dio());

  locator.registerSingleton<ProductServices>(ProductServices(locator()));
  locator.registerSingleton<ProductRepository>(ProductRepositoryImp(locator()));

  locator.registerSingleton<GetProductUseCase>(
    GetProductUseCase(locator())
  );
  locator.registerSingleton<ProductBloc>(
    ProductBloc(locator())
  );
}