import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/data/datasource/auth_datasource.dart';
import 'package:loginfirebase/data/repositories/auth_repositories_impl.dart';
import 'package:loginfirebase/domain/repositories/auth_repositories.dart';
import 'package:loginfirebase/domain/use_case/is_sign_in_usecase.dart';
import 'package:loginfirebase/domain/use_case/sign_in_with_google_usecase.dart';
import 'package:loginfirebase/presentation/manager/auth/auth_bloc.dart';
import 'package:loginfirebase/presentation/pages/splashscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
    BlocProvider(create: (context) {
      AuthDatasource authDatasource = AuthDatasource();
      AuthRepositories authRepository = AuthRepositoriesImpl(authDatasource);
      return AuthBloc(
      IsSignInUsecase(authRepository), 
      SignInWithGoogleUsecase(authRepository),
      );
    }
  )
], 
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          home: SplashScreen(),
      ),
    );
  }
}