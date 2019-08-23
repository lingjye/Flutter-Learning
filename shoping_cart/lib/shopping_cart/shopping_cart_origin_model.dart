// 定义商品Item类

// class Item {
//   double price;
//   String name;
//   // Item(name, price) {
//   //   this.name = name;
//   //   this.price = price;
//   // }
//   Item(this.name, this.price);
// }

// 打印类
abstract class PrintHelper {
  printInto() => print(getInfo());
  getInfo();
}

class Meta {
  double price;
  String name;
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);
  // 重载了 + 运算符 ， 合并商品为套餐商品
  Item operator + (Item item) => Item(name + item.name, price + item.price);
}

// 定义购物车类

class ShoppingCart extends Meta with PrintHelper {
  String name;
  DateTime date;
  String code;
  List<Item> bookings;

  // double get price {
  //   double sum = 0.0;
  //   for (var i in bookings) {
  //     sum += i.price;
  //   }
  //   return sum;
  // }

  double get price => bookings.reduce((value, element) => value + element).price;


  // ShoppingCart(name, code) {
  //   this.name = name;
  //   this.code = code;
  //   this.date = DateTime.now();
  // }
  
  // 删掉了构造函数函数体
  // ShoppingCart(this.name, this.code) : date = DateTime.now(), super(name, 0);

    // 默认初始化方法， 转发到withCode里
  ShoppingCart({name}) : this.withCode(name:name, code:null);
  ShoppingCart.withCode({name, this.code}) : date = DateTime.now(), super(name, 0);

  getInfo() {
    return '''
      购物车信息： 
      =======================
      用户名： $name,
      优惠码： $code,
      总价： $price,
      日期： ${date.toString()}
      =======================
    ''';
  }
}

void main(List<String> args) {
  // ShoppingCart sc = ShoppingCart('张三', '12345678');
  ShoppingCart sc = ShoppingCart.withCode(name:'张三', code:'123455');
  sc.bookings = [Item('苹果', '10.0'), Item('梨', '5.0')];
  print(sc.getInfo());

  ShoppingCart sc2 = ShoppingCart(name: '张三');
  sc2.bookings = [Item('香蕉',15.0), Item('西瓜', 40.0)];
  print(sc2.getInfo());
 
  ShoppingCart.withCode(name:'李四', code: '1234354')
  ..bookings = [Item('栗子', 20), Item('萝卜', 2)]
  ..printInto();
}