import 'lib/bank_account.dart';

void main() {
  final account = BankAccount.empty(ownerName: 'Тимур');

  print('Владелец: ${account.ownerName}');
  print('Начальный баланс: ${account.balance}');

  account.deposit(1000);
  account.withdraw(250);
  account.withdraw(1000);
  account.deposit(0);

  print('Итоговый баланс: ${account.balance}');
}
