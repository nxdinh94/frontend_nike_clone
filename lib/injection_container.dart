import 'package:dio/dio.dart';
import 'package:fe_nike/features/authentication/data/data_sources/auth_services.dart';
import 'package:fe_nike/features/authentication/data/repositories/auth_repository_imp.dart';
import 'package:fe_nike/features/authentication/domain/repositories/auth_repository.dart';
import 'package:fe_nike/features/authentication/domain/usecases/login.dart';
import 'package:fe_nike/features/authentication/domain/usecases/logout.dart';
import 'package:fe_nike/features/authentication/domain/usecases/register.dart';
import 'package:fe_nike/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:fe_nike/features/home/products/data/data_sources/product_services.dart';
import 'package:fe_nike/features/home/products/data/responsitory/product_repository_imp.dart';
import 'package:fe_nike/features/home/products/domain/responsitory/product_repository.dart';
import 'package:fe_nike/features/home/products/domain/usecases/get_product.dart';
import 'package:fe_nike/features/home/products/presentation/bloc/product_bloc.dart';
import 'package:fe_nike/util/token_interceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> setupLocator ()async{
  // Dio
  Dio dio = Dio();
  dio.interceptors.add(TokenInterceptor()); // Add this code
  locator.registerLazySingleton(() => dio);

  locator.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
  locator.registerSingleton<ProductServices>(ProductServices(locator()));
  locator.registerSingleton<ProductRepository>(ProductRepositoryImp(locator()));
  locator.registerSingleton<GetProductUseCase>(GetProductUseCase(locator()));
  locator.registerSingleton<ProductBloc>(ProductBloc(locator()));



  locator.registerSingleton<AuthServices>(AuthServices(locator()));
  locator.registerSingleton<AuthRepository>(AuthRepositoryImp(locator()));
  locator.registerSingleton<LoginUseCase>(LoginUseCase(locator()));
  locator.registerSingleton<LogOutUseCase>(LogOutUseCase(locator()));
  locator.registerSingleton<RegisterUseCase>(RegisterUseCase(locator()));
  locator.registerSingleton<AuthBloc>(AuthBloc(locator(), locator(), locator()));

}