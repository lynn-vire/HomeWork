enum OrderStage {
  created('Создан'),
  paid('Оплачен'),
  inTransit('В пути'),
  delivered('Доставлен');

  final String russianName;

  const OrderStage(this.russianName);
}

class Order {
  final int number;
  OrderStage stage = OrderStage.created;

  Order(this.number);

  void moveToNextStage() {
    switch (stage) {
      case OrderStage.created:
        stage = OrderStage.paid;
      case OrderStage.paid:
        stage = OrderStage.inTransit;
      case OrderStage.inTransit:
        stage = OrderStage.delivered;
      case OrderStage.delivered:
        print('Заказ №$number уже доставлен, дальше двигать некуда.');
    }
  }

  void showCustomerMessage() {
    switch (stage) {
      case OrderStage.created:
        print('Заказ №$number создан и ожидает оплаты.');
      case OrderStage.paid:
        print('Заказ №$number оплачен и готовится к отправке.');
      case OrderStage.inTransit:
        print('Курьер уже едет к вам.');
      case OrderStage.delivered:
        print('Заказ №$number доставлен.');
    }
  }
}

void main() {
  final order = Order(1001);

  while (true) {
    print('Статус заказа №${order.number}: ${order.stage.russianName}');
    order.showCustomerMessage();
    if (order.stage == OrderStage.delivered) break;
    order.moveToNextStage();
  }

  order.moveToNextStage();
}
