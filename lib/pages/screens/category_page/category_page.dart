import 'package:e_com_exam/utils/product.dart';
import 'package:e_com_exam/utils/routes.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    String categorydata = ModalRoute.of(context)!.settings.arguments as String;
    List filterList =
        product.where((e) => e['category'] == categorydata).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          categorydata,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.detailpage,
                      arguments: filterList[index]);
                },
                child: Container(
                  margin:
                      const EdgeInsets.only(bottom: 10, right: 16, left: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 3,
                      color: Colors.primaries[
                          filterList.indexOf(filterList[index]) % 18],
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
                            filterList[index]['thumbnail'],
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
                                "${filterList[index]['title']}",
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                " ${filterList[index]['description']}",
                                maxLines: 2,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text("\$ ${filterList[index]['price']}"),
                              Text("${filterList[index]['rating']} ⭐"),
                              Text(
                                  "${filterList[index]['brand'] ?? "NO BRAND"}"),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
