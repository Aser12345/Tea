import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tea_site/core/app/store/auth/user_data.dart';
import 'package:tea_site/features/regist/presentation/widgets/alert_reg.dart';

class Regist extends StatelessWidget {
  const Regist({super.key, required this.registration});
  final UserData registration;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 152, 112, 30),
      ),
      backgroundColor: const Color.fromARGB(255, 152, 112, 30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
              child: Center(
                  child: Container(
            padding: const EdgeInsets.all(30),
            height: 600,
            width: 750,
            decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 152, 112, 30),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Регистрация',
                  style: TextStyle(
                      fontFamily: 'Nekst', fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 7,
                ),
                TextField(
                  controller: registration.login,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.password,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(registration.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: registration.checkPassword,
                    maxLength: 30,
                    obscureText: registration.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Повторите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              registration.changerPass();
                            },
                            icon: Icon(registration.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (registration.password.text !=
                            registration.checkPassword.text) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Пароли не совпадают!',
                                  ));
                        } else if (registration.password.text.length < 6 ||
                            registration.checkPassword.text.length < 6) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText:
                                        'Пароль должен быть больше шести символов!',
                                  ));
                        } else if (registration.password.text.isEmpty ||
                            registration.checkPassword.text.isEmpty ||
                            registration.login.text.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => const AlertReg(
                                    alertText: 'Заполни все поля!',
                                  ));
                        } else {
                          try {
                            await registration.signUp();
                            if (registration.user == null) {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Пользователь существует')));
                            } else {
                              // ignore: use_build_context_synchronously
                              context.go('/');
                            }
                          } catch (error) {
                            // Show error message to user
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Пользователь существует'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        'Зарегистрироваться',
                        style: TextStyle(
                          fontFamily: 'Nekst',
                          color: Color.fromARGB(255, 101, 35, 35),
                        ),
                      )),
                )
              ],
            ),
          )))
        ],
      ),
    );
  }
}
