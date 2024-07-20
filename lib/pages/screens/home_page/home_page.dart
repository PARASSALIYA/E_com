import 'package:e_com_exam/utils/product.dart';
import 'package:e_com_exam/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Home Page"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.cartpage);
            },
            child: const Icon(Icons.shopping_cart),
          ),
          SizedBox(
            width: s.width * 0.03,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: s.height * 0.2,
              width: s.width,
              decoration: BoxDecoration(
                color: Colors.grey,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5,
                    offset: Offset(5, 5),
                  )
                ],
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://graphicsfamily.com/wp-content/uploads/edd/2021/07/Professional-E-Commerce-Shoes-Banner-Design.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                ),
                label: const Text("search"),
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...AllCategory.map(
                    (e) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          Routes.categorypage,
                          arguments: e,
                        );
                      },
                      child: Container(
                        height: 70,
                        width: 100,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 2,
                            color:
                                Colors.primaries[AllCategory.indexOf(e) % 18],
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 3,
                              offset: Offset(3, 3),
                            ),
                          ],
                        ),
                        child: Text(e),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: s.height * 0.02,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: product.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4.2 / 7,
                ),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      Routes.detailpage,
                      arguments: product[index],
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                      border: Border.all(
                        width: 2.5,
                        color: Colors
                            .primaries[product.indexOf(product[index]) % 18],
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(5, 5),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product[index]['thumbnail'],
                        ),
                        Text(
                          product[index]['title'],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${product[index]['description']}",
                          style: const TextStyle(
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${product[index]['category']}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${product[index]['price']} \$",
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
