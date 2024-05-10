import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loginfirebase/presentation/manager/auth/auth_bloc.dart';
import 'package:loginfirebase/presentation/pages/home.dart';
import 'package:loginfirebase/presentation/pages/login.dart';
// import 'package:loginfirebase/presentation/pages/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // Future.delayed(const Duration(seconds: 5)).then((value) => Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => const Login()),
    //     ));
    context.read<AuthBloc>().add(IsSignedIWithnGoogleEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      // fungsi "listenwhen" untuk membantu peformance apps
      listenWhen: (AuthState prevState, AuthState nextState) => 
        prevState is IsSignedIWithnGoogleLoading &&
        (nextState is IsSignedIWithnGoogleSuccess || 
        nextState is IsSignedIWithnGoogleError),
      listener: (context, state) {
        if (state is IsSignedIWithnGoogleSuccess) {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
          );
        }

        if (state is IsSignedIWithnGoogleError) {
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          );
        }
      },
      child: Scaffold(
        body: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.deepPurple, Colors.blue],
              ),
            ),
            child: const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Edspert.Id',
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ])),
      ),
    );
  }
}
