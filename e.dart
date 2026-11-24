import 'dart:io';

void main() {
  // int a = 89;
  //   switch (a) {
  //     case >= 21:
  //       print('вход разрешен');

  //     case <= 21:
  //     default:
  //       print('вход запещен');
  //   }

  stdout.write('Ваше имя:');
  String? name = stdin.readLineSync();
  print('меня зовут $name');
}
