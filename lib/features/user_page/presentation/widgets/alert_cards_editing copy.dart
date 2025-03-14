// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tea_site/core/app/store/auth/user_data.dart';
import 'package:tea_site/features/regist/presentation/widgets/alert_reg.dart';

class AlertCardsEditing extends StatelessWidget {
  const AlertCardsEditing(
      {super.key, required this.userData, required this.card});
  final UserData userData;
  final String card;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 152, 112, 30),
      content: Text(
        'Текущая карта: $card',
        style: const TextStyle(fontSize: 25, color: Colors.white),
      ),
      actions: [
        TextField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          controller: userData.card,
          maxLength: 5,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Банковаская карта',
            hintStyle: TextStyle(fontFamily: 'Nekst', color: Colors.white),
          ),
        ),
        TextButton(
            onPressed: () {
              if (userData.card.text.isEmpty ||
                  userData.card.text == ' ' ||
                  userData.card.text.length != 5) {
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Карта недобавлена!',
                        ));
              } else {
                userData.modifyCard(
                    userData.cardList.indexOf(card), userData.card.text);
                userData.card.clear();
                Navigator.pop(context);
                showDialog(
                    context: context,
                    builder: (context) => const AlertReg(
                          alertText: 'Карта успешно добавлена!',
                        ));
              }
            },
            child: const Text(
              'Добавить',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ))
      ],
    );
  }
}
