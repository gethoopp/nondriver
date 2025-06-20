import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ondriver/Asset/asset.dart';
import 'package:ondriver/components/routes.dart';
import 'package:ondriver/controller/bloc/user_cubit/user_cubit_cubit.dart';
import 'package:ondriver/controller/repository/user_auth_login/base_user_auth.dart';
import 'package:ondriver/controller/repository/user_auth_login/user_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ondriver/extension/string_validate.dart';
import 'package:ondriver/widget/button_login.dart';

class LoginUserScreen extends StatelessWidget {
  const LoginUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseUserAuthRepository userAuthRepository = GetUserAuth();

    return RepositoryProvider.value(
      value: userAuthRepository,
      child: BlocProvider(
        create: (context) => UserCubitCubit(userAuthRepository),
        child: _LoginScreenUser(),
      ),
    );
  }
}

class _LoginScreenUser extends StatefulWidget {
  const _LoginScreenUser();

  @override
  State<_LoginScreenUser> createState() => _LoginScreenUserState();
}

class _LoginScreenUserState extends State<_LoginScreenUser> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<UserCubitCubit, UserCubitState>(
      listener: (context, state) {
        if (state is UserCubitLoaded) {
          Center(child: CircularProgressIndicator());
        }

        if (state is UserCubitSuccesState) {
          // Future.delayed(Duration(seconds: 1), () {
          //   if (mounted) {
          //     AwesomeDialog(
          //       // ignore: use_build_context_synchronously
          //       context: context,
          //       title: 'Success',
          //       desc: 'Berhasil Masuk',
          //       dialogType: DialogType.success,
          //     ).show();
          //   }
          // });

          if (emailController.text == 'user1@gmail.com') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashboard,
              (route) => false,
            );
          } else if (emailController.text == 'resto1@gmail.com') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashBoardResto,
              (route) => false,
            );
          } else if (emailController.text == 'driver1@gmail.com') {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.dashBordDriver,
              (route) => false,
            );
          }
        }

        if (state is UserErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message!),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.asset(Asset.imagebgLogin, fit: BoxFit.contain),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.05),
              child: Column(
                children: [
                  buttonLogin(
                    size,
                    text: 'Email',
                    obs: false,
                    controll: emailController,
                    validator: (text) => text.validateEmail,
                    onChanged: (value) {
                      setState(() {
                        emailController.text = value;
                      });
                      return value;
                    },
                  ),
                  const SizedBox(height: 20),
                  buttonLogin(
                    size,
                    text: 'Password',
                    obs: true,
                    controll: passController,
                    validator: (text) => text.validatePassword,
                    onChanged: (value) {
                      setState(() {
                        passController.text = value;
                      });
                      return value;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.08),
                  child: Text(
                    'Forgot Password ?',
                    style: GoogleFonts.outfit(color: Colors.redAccent),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 25),
            buttonLoginTap(
              onTap: () {
                context.read<UserCubitCubit>().loginUser(
                  emailController.text,
                  passController.text,
                );
              },
              size,
              text: 'Login',
              colorbtn:
                  emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty &&
                      passController.text.length >= 5
                  ? Colors.redAccent
                  : Colors.grey,
              emailController.text.isNotEmpty &&
                      passController.text.isNotEmpty &&
                      passController.text.length >= 5
                  ? Colors.redAccent
                  : Colors.grey,
              textColor: Colors.white,
            ),
            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: Text(
                'Or continue with social account',
                style: GoogleFonts.outfit(color: Colors.grey),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.03),
              child: buttonLoginTap(
                size,
                text: 'Google',
                colorbtn: Colors.transparent,
                null,
                textColor: Colors.black,
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: size.height * 0.02),
              child: buttonLoginTap(
                size,
                text: 'Apple ID',
                colorbtn: Colors.transparent,
                null,
                textColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
