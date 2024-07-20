import 'package:e_com_exam/utils/product.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double totalPrice = 0;
  @override
  void initState() {
    addPrice();
    super.initState();
  }

  void addPrice() {
    for (var e in cart) {
      totalPrice += e['price'];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Page"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(bottom: 10, right: 16, left: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 3,
                    color: Colors.primaries[cart.indexOf(cart[index]) % 18],
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 3,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(
                          cart[index]['thumbnail'],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cart[index]['title']}",
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text("\$ ${cart[index]['price']}"),
                            Text("${cart[index]['rating']} ⭐"),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (cart[index]['qty'] > 1) {
                                      cart[index]['qty']--;
                                    }
                                    addPrice();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.remove),
                                ),
                                Text(
                                  "${cart[index]['qty']}",
                                ),
                                IconButton(
                                  onPressed: () {
                                    cart[index]['qty']++;
                                    addPrice();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                            ListTile(
                              onTap: () {
                                cart.remove(cart[index]);

                                setState(() {});
                              },
                              title: const Text("Remove"),
                              leading: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
            Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 3,
                  )
                ]),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              "TotalPrice: ${cart.isEmpty ? 0.00 : totalPrice.toStringAsFixed(2)}",
            ),
          ),
        ],
      ),
    );
  }
}
