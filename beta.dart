class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      throw ArgumentError.value(amount, 'amount', 'Must be greater than zero');
    }

    _balance += amount;
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      throw ArgumentError.value(amount, 'amount', 'Must be greater than zero');
    }
    if (amount > _balance) {
      throw StateError('Insufficient funds');
    }

    _balance -= amount;
  }
}

void main() {
  final account = BankAccount();
  account.deposit(100);
  account.withdraw(30);

  print('Balance: ${account.balance}');
}
