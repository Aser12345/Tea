import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:tea_site/core/app/store/auth/user_data.dart';

class Auth extends StatelessWidget {
  const Auth({super.key, required this.authentification});
  final UserData authentification;

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
            height: 390,
            width: 750,
            decoration: const BoxDecoration(
                color: const Color.fromARGB(255, 152, 112, 30),
                borderRadius: BorderRadius.all(Radius.circular(30))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Вход в систему',
                  style: TextStyle(
                      fontFamily: 'Nekst', fontSize: 35, color: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: authentification.login,
                  maxLength: 30,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                      hintText: 'Введите почту',
                      hintStyle:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white)),
                ),
                const SizedBox(
                  height: 15,
                ),
                Observer(
                  builder: (_) => TextField(
                    controller: authentification.password,
                    maxLength: 30,
                    obscureText: authentification.passVisib,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: 'Введите пароль',
                        hintStyle: const TextStyle(
                            fontFamily: 'Nekst', color: Colors.white),
                        suffixIcon: IconButton(
                            onPressed: () {
                              authentification.changerPass();
                            },
                            icon: Icon(authentification.passVisib
                                ? Icons.visibility_off
                                : Icons.remove_red_eye))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                    onPressed: () {
                      context.push('/regist');
                    },
                    child: const Text(
                      'Зарегистрироваться',
                      style:
                          TextStyle(fontFamily: 'Nekst', color: Colors.white),
                    )),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await authentification.signIn();
                          if (authentification.user == null) {
                            // ignore: use_build_context_synchronously
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Неверный логин или пароль')));
                          } else {
                            // ignore: use_build_context_synchronously
                            context.go('/');
                          }
                        } catch (error) {
                          // Show error message to user
                          // ignore: use_build_context_synchronously
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Ошибка входа не правильный логин или пароль'),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Войти',
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
