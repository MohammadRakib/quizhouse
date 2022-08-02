class ShopItemModel{

  String quantity;
  String price;

  ShopItemModel({required this.quantity, required this.price});

  Map<String, dynamic> toMap() {
    return {
      'quantity': quantity,
      'price': price,
    };
  }

  @override
  String toString() {
    return 'ShopItemModel{quantity: $quantity, price: $price}';
  }
}