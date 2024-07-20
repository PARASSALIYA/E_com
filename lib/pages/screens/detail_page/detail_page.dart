import 'package:card_swiper/card_swiper.dart';
import 'package:e_com_exam/utils/product.dart';
import 'package:e_com_exam/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> detaildata =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${detaildata['title']}",
        ),
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
        padding: const EdgeInsets.all(10),
        child: GestureDetector(
          onDoubleTap: () {
            detaildata['qty'] = 1;
            cart.add(detaildata);
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        detaildata['images'].length,
                        (index) => Container(
                          height: s.height * 0.5,
                          width: s.width * 0.9,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Swiper(
                            pagination: const SwiperPagination(),
                            itemCount: detaildata['images'].length,
                            loop: false,
                            itemBuilder: (context, index) => Image.network(
                              detaildata['images'][index],
                              fit: BoxFit.cover,
                            ),
                            physics: const ScrollPhysics(
                              parent: ScrollPhysics(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  " ${detaildata['title']}",
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 24,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text(
                  " ${detaildata['description']}",
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text(
                  "${detaildata['price']} \$",
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  "Brand Name: ${detaildata['brand'] ?? "NO BRAND"}",
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Container(
                  height: 25,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xff46B67A),
                  ),
                  child: Center(
                    child: Text(
                      "${detaildata['rating']}⭐",
                      maxLines: 2,
                      style: const TextStyle(
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                const Divider(),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Text(
                  "Product Details",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Text("Name : ${detaildata['title']}"),
                Text("Brand Name: ${detaildata['brand'] ?? "NO Brand"}"),
                Text("Price : ${detaildata['price']}"),
                Text("Category : ${detaildata['category']}"),
                Text("Rating : ${detaildata['rating']} ⭐"),
                Text("Stock : ${detaildata['stock']}"),
                Text("Discount : ${detaildata['discountPercentage']}"),
                Text("Stock : ${detaildata['stock']}"),
                Text("Weight: ${detaildata['weight'] ?? "0"}"),
                Row(
                  children: [
                    const Text("Tags : "),
                    ...List.generate(
                      detaildata['tags'].length,
                      (index) => Text(
                        " ${detaildata['tags'][index]} ,",
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  1,
                  (index) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Dimensions: "),
                      Text("width:${detaildata['dimensions']['width']},"),
                      Text("height: ${detaildata['dimensions']['height']},"),
                      Text("depth: ${detaildata['dimensions']['depth']}"),
                    ],
                  ),
                ),
                Text("Description : ${detaildata['description']}"),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Divider(),
                const Text(
                  "Customer Ratings & Reviews",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                Row(
                  children: [
                    Text(
                      " ${detaildata['rating']}",
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      width: s.width * 0.03,
                    ),
                    RatingBar.builder(
                      onRatingUpdate: (rating) {},
                      initialRating: detaildata['rating'],
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 25,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Review: ",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                ...List.generate(
                  1,
                  (index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("rating: ${detaildata['reviews'][0]['rating']}"),
                      Text("comment: ${detaildata['reviews'][0]['comment']}"),
                      Text("date: ${detaildata['reviews'][0]['date']}"),
                      Text(
                          "reviewerName: ${detaildata['reviews'][0]['reviewerName']}"),
                      Text(
                          "reviewerEmail: ${detaildata['reviews'][0]['reviewerEmail']}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text("rating: ${detaildata['reviews'][1]['rating']}"),
                      Text("comment: ${detaildata['reviews'][1]['comment']}"),
                      Text("date: ${detaildata['reviews'][1]['date']}"),
                      Text(
                          "reviewerName: ${detaildata['reviews'][1]['reviewerName']}"),
                      Text(
                          "reviewerEmail: ${detaildata['reviews'][1]['reviewerEmail']}"),
                      SizedBox(
                        height: s.height * 0.02,
                      ),
                      Text("rating: ${detaildata['reviews'][2]['rating']}"),
                      Text("comment: ${detaildata['reviews'][2]['comment']}"),
                      Text("date: ${detaildata['reviews'][2]['date']}"),
                      Text(
                          "reviewerName: ${detaildata['reviews'][2]['reviewerName']}"),
                      Text(
                          "reviewerEmail: ${detaildata['reviews'][2]['reviewerEmail']}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: s.height * 0.01,
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
