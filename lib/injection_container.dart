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
import 'package:fe_nike/features/product_detail/data/data_sources/detail_product_service.dart';
import 'package:fe_nike/features/product_detail/data/respository/detail_product_repos_imp.dart';
import 'package:fe_nike/features/product_detail/domain/respository/detail_product_repos.dart';
import 'package:fe_nike/features/product_detail/domain/usecases/change_favorite_usecase.dart';
import 'package:fe_nike/features/product_detail/domain/usecases/get_favorite_usecase.dart';
import 'package:fe_nike/features/product_detail/presentation/bloc/change_favorite/bloc.dart';
import 'package:fe_nike/features/profile/me/data/data_sources/me_services.dart';
import 'package:fe_nike/features/profile/me/data/responsitory/me_repository_imp.dart';
import 'package:fe_nike/features/profile/me/domain/responsitory/me_reponsitory.dart';
import 'package:fe_nike/features/profile/me/domain/usecases/get_me.dart';
import 'package:fe_nike/features/profile/me/presentation/bloc/me_bloc.dart';
import 'package:fe_nike/util/token_interceptor.dart';
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


  //me
  locator.registerSingleton<MeServices>(MeServices(locator()));
  locator.registerSingleton<MeRepository>(MeRepositoryImp(locator()));
  locator.registerSingleton<GetMeUseCases>(GetMeUseCases(locator()));
  locator.registerSingleton<MeBloc>(MeBloc(locator()));

  //detail product bloc

  locator.registerSingleton<DetailProductService>(DetailProductService(locator()));
  locator.registerSingleton<DetailProductRepository>(DetailProductRepoImp(locator()));
  locator.registerSingleton<ChangeFavoriteUseCase>(ChangeFavoriteUseCase(locator()));
  locator.registerSingleton<GetFavoriteUsecase>(GetFavoriteUsecase(locator()));
  locator.registerSingleton<GetFavoriteBloc>(GetFavoriteBloc(locator(), locator()));


}