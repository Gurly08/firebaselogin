import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loginfirebase/presentation/manager/auth/auth_bloc.dart';
import 'package:loginfirebase/presentation/pages/sign.dart';
import 'package:loginfirebase/presentation/widget/login_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 155, 33, 255),
        body: SafeArea(
            bottom: false,
            child: Stack(
              children: [
                //gambar sebagai gambar tampilan disetiap landing page(Sebagai BG)
                Image.asset(
                  "assets/images/wlp1.png",
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                ),

                //pembuatan container untuk isi konten
                ListView(
                  children: [
                    const SizedBox(
                      height: 325,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromARGB(255, 110, 12, 190),
                            Color.fromARGB(255, 93, 34, 255),
                          ], // Gradient colors
                        ),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(45),
                        ),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 45),
                        child: Column(
                          children: [
                            Text(
                              "ReproEd",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              "Eksplorasi kesehatan reproduksi dengan materi, latihan soal, dan edukasi. Gunakan Aplikasi ReproEd sekarang untuk pengalaman yang menyenangkan dan memberikan edukasi.",
                              maxLines: 7,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(height: 35),
                            BlocConsumer<AuthBloc, AuthState>(
                              listenWhen: (prev, next) => 
                              prev is SignInGoogleLoading &&
                              (next is SignInGoogleError ||
                              next is SignInGoogleSuccess),
                              listener: (context, state) {
                                print('Listener: AuthBloc...');
                                if (state is SignInGoogleSuccess) {
                                  print('Google Sign In Success: ${state.email}');
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => const Sign()),
                                  );
                                }
                              },
                              buildWhen: (prev, next) => 
                              prev is SignInGoogleLoading &&
                              (next is SignInGoogleError ||
                              next is SignInGoogleSuccess),
                              builder: (context, state) {
                                if (state is SignInGoogleLoading) {
                                  return const CircularProgressIndicator();
                                }
                                return LoginButton(
                                onPressed: () {
                                    context
                                    .read<AuthBloc>()
                                    .add(SignInGoogleEvent());
                                  },
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Apakah kamu sudah memiliki akun ReproEd?",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 8,
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Sign()));
                                  },
                                  child: Text(
                                    "Daftar",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                        fontSize: 8,
                                        color:
                                            Color.fromARGB(255, 197, 219, 255),
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
