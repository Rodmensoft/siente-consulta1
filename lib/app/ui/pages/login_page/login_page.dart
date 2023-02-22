import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siente_app/app/ui/global_widgets/customed_button.dart';
import 'package:siente_app/app/ui/global_widgets/customed_textfield.dart';
import 'package:siente_app/app/ui/global_widgets/logo.dart';
import 'package:siente_app/app/ui/pages/login_page/local_widgets/failed_message.dart';
import 'package:siente_app/app/ui/pages/login_page/login_controller.dart';
import 'package:siente_app/app/ui/theme/color_theme.dart';

import '../splash_page/splash_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 32.sp),
        decoration: BoxDecoration(
          gradient: ColorTheme.backgroundGradient,
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 130.0.sp),
              const TopSlogan(),
              SizedBox(height: 99.05.sp),
              GetBuilder<LoginController>(
                id: 'user_field',
                builder: (_) {
                  return CustomedTextField(
                    width: double.infinity,
                    focusNode: _.userNode,
                    controller: _.userCtrl,
                    hintText: 'Usuario',
                    imageIcon: 'assets/new/login/account_circle.png',
                    keyboardType: TextInputType.emailAddress,
                    onEditingComplete: () => _.nextFocus(),
                    onTap: () => _.focusUsuario(),
                  );
                },
              ),
              SizedBox(height: 11.sp),
              GetBuilder<LoginController>(
                id: 'password_field',
                builder: (_) {
                  return CustomedTextField(
                    width: double.infinity,
                    focusNode: _.passwordNode,
                    controller: _.passwordCtrl,
                    hintText: 'Contraseña',
                    imageIcon: 'assets/new/login/lock_circle.png',
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    onEditingComplete: () => _.login(),
                    onTap: () => _.focusPassword(),
                  );
                },
              ),
              SizedBox(height: 12.sp),
              GetBuilder<LoginController>(
                id: 'button_field',
                builder: (_) {
                  return CustomedButton(
                    onPressed: () {
                      if (!_.loading) _.login();
                    },
                    loading: _.loading,
                    height: 58.sp,
                    width: double.infinity,
                    text: 'Ingresar',
                    text2: 'Ingresando',
                  );
                },
              ),
              GetBuilder<LoginController>(
                id: 'failed_field',
                builder: (_) {
                  return FailedMessage(failed: _.failed);
                },
              ),
              FooterImage(
                width: 259.57.sp,
                height: 64.64.sp,
              ),
              SizedBox(height: 41.sp),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: '2023 Powered by '),
                    TextSpan(
                      text: 'interkont.co',
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w400,
                  fontSize: 11.sp,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
