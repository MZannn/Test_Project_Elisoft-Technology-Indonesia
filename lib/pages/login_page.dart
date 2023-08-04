import 'package:flutter/material.dart';
import 'package:test_project/blocs/login/login_cubit.dart';
import 'package:test_project/constants/color_constants.dart';
import 'package:test_project/routes/routes.dart';
import 'package:test_project/widgets/custom_alert_dialog.dart';
import 'package:test_project/widgets/custom_button.dart';
import 'package:test_project/widgets/custom_text_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    final TextEditingController usernameC = TextEditingController();
    final TextEditingController passwordC = TextEditingController();
    final Key formKey = GlobalKey<FormState>();
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Image.asset(
                  'assets/images/logo.png',
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                controller: usernameC,
                label: 'Username',
              ),
              const SizedBox(
                height: 16,
              ),
              BlocSelector<LoginCubit, LoginState, bool>(
                selector: (state) {
                  if (state is LoginPasswordIsHidden) {
                    return state.isHidden;
                  } else {
                    return true;
                  }
                },
                builder: (context, state) {
                  return CustomTextField(
                    controller: passwordC,
                    label: 'Password',
                    obscureText: state,
                    suffixIcon: true,
                    onPressed: () => loginCubit.passwordIsHidden(),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) {
                  if (state is LoginLoading) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: ColorConstants.secondaryColor,
                            ),
                          ),
                        );
                      },
                    );
                  }
                  if (state is LoginSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      Routes.articles,
                      (route) => false,
                    );
                  }
                  if (state is LoginError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (usernameC.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomAlertDialog(
                              message: 'Username cant Empty',
                            );
                          },
                        );
                      } else if (passwordC.text.isEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const CustomAlertDialog(
                              message: 'Password cant Empty',
                            );
                          },
                        );
                      } else {
                        loginCubit.login(
                          usernameC.text,
                          passwordC.text,
                        );
                      }
                    },
                    label: 'Login',
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
