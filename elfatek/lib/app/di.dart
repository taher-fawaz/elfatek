// import 'package:elfatek/data/data_source/local_data_source.dart';
// import 'package:elfatek/data/data_source/remote_data_source.dart';
// import 'package:elfatek/data/network/app_api.dart';
// import 'package:elfatek/data/network/dio_factory.dart';
// import 'package:elfatek/data/network/network_info.dart';
// import 'package:elfatek/data/repository/repository_impl.dart';
// import 'package:elfatek/domain/repository/repository.dart';
// import 'package:elfatek/domain/usecase/forgot_password_usecase.dart';
// import 'package:elfatek/domain/usecase/home_usecase.dart';
// import 'package:elfatek/domain/usecase/login_usecase.dart';
// import 'package:elfatek/domain/usecase/register_usecase.dart';
// import 'package:elfatek/domain/usecase/store_details_usecase.dart';
// import 'package:elfatek/presentation/forgot_password/forgot_password_viewmodel.dart';
// import 'package:elfatek/presentation/login/login_viewmodel.dart';
// import 'package:elfatek/presentation/main/home/home_viewmodel.dart';
// import 'package:elfatek/presentation/register/register_viewmodel.dart';
// import 'package:elfatek/presentation/store_details/store_details_viewmodel.dart';
// import 'package:data_connection_checker/data_connection_checker.dart';
// import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'app_prefs.dart';

// final instance = GetIt.instance;

// Future<void> initAppModule() async {
//   final sharedPrefs = await SharedPreferences.getInstance();

//   // shared prefs instance
//   instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

//   // app prefs instance
//   instance
//       .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

//   // network info
//   instance.registerLazySingleton<NetworkInfo>(
//       () => NetworkInfoImpl(DataConnectionChecker()));

//   // dio factory
//   instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

//   // app  service client
//   final dio = await instance<DioFactory>().getDio();
//   instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

//   // remote data source
//   instance.registerLazySingleton<RemoteDataSource>(
//       () => RemoteDataSourceImplementer(instance()));

//   // local data source
//   instance.registerLazySingleton<LocalDataSource>(
//       () => LocalDataSourceImplementer());

//   // repository
//   instance.registerLazySingleton<Repository>(
//       () => RepositoryImpl(instance(), instance(), instance()));
// }

// initLoginModule() {
//   if (!GetIt.I.isRegistered<LoginUseCase>()) {
//     instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
//     instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
//   }
// }

// initForgotPasswordModule() {
//   if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
//     instance.registerFactory<ForgotPasswordUseCase>(
//         () => ForgotPasswordUseCase(instance()));
//     instance.registerFactory<ForgotPasswordViewModel>(
//         () => ForgotPasswordViewModel(instance()));
//   }
// }

// initRegisterModule() {
//   if (!GetIt.I.isRegistered<RegisterUseCase>()) {
//     instance
//         .registerFactory<RegisterUseCase>(() => RegisterUseCase(instance()));
//     instance.registerFactory<RegisterViewModel>(
//         () => RegisterViewModel(instance()));
//     instance.registerFactory<ImagePicker>(() => ImagePicker());
//   }
// }

// initHomeModule() {
//   if (!GetIt.I.isRegistered<HomeUseCase>()) {
//     instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
//     instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
//   }
// }

// initStoreDetailsModule() {
//   if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
//     instance.registerFactory<StoreDetailsUseCase>(
//         () => StoreDetailsUseCase(instance()));
//     instance.registerFactory<StoreDetailsViewModel>(
//         () => StoreDetailsViewModel(instance()));
//   }
// }

// resetModules() {
//   instance.reset(dispose: false);
//   initAppModule();
//   initHomeModule();
//   initLoginModule();
//   initRegisterModule();
//   initForgotPasswordModule();
//   initStoreDetailsModule();
// }
