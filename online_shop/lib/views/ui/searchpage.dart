import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:online_shop/models/sneaker_model.dart';
import 'package:online_shop/services/helper.dart';
import 'package:online_shop/views/shared/CustomField.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_packages.dart';
import 'package:online_shop/views/ui/product_page.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController search = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100.h,
        backgroundColor: Colors.black,
        elevation: 0,
        title: CustomField(
          hintText: "Srearch for a product",
          controller: search,
          onEditingComplete: () {
            setState(() {});
          },
          prefixIcon: GestureDetector(
            onTap: () {},
            child: const Icon(AntDesign.camera, color: Colors.black),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(
              AntDesign.search1,
              color: Colors.black,
            ),
          ), 
        ),
      ),
      body: search.text.isEmpty
          ? Container(
              height: 600.h,
              padding: EdgeInsets.all(20.h),
              child: Image.asset("assets/images/Pose23.png"),
            )
          : FutureBuilder<List<Sneakers>>(
              future: Helper().search(search.text),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: reusableText(
                        text: "error Retiving the data",
                        style: appstyle(20, Colors.black, FontWeight.bold)),
                  );
                } else if (snapshot.data!.isEmpty) {
                  return Center(
                    child: reusableText(
                        text: "Products not find",
                        style: appstyle(20, Colors.black, FontWeight.bold)),
                  );
                } else {
                  final shoes = snapshot.data;
                  return ListView.builder(
                    itemCount: shoes!.length,
                    itemBuilder: ((context, index) {
                      final shoe = shoes[index];
                      return GestureDetector(
                        onTap: () {
                          productProvider.shoesSizes = shoe.sizes;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductPage(id: '', category: '',
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.h),
                          child: Container(
                            height: 100.h,
                            width: 325,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade500,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0.3,
                                      offset: const Offset(0, 1))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(12.h),
                                      child: CachedNetworkImage(
                                        imageUrl: shoe.imageUrl[0],
                                        width: 70.w,
                                        height: 70.h,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: 12.h,
                                        left: 20.w,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          reusableText(
                                              text: shoe.name,
                                              style: appstyle(16, Colors.black,
                                                  FontWeight.w600)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          reusableText(
                                              text: shoe.category,
                                              style: appstyle(16, Colors.black,
                                                  FontWeight.w600)),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          reusableText(
                                              text: "\$ ${shoe.price}",
                                              style: appstyle(16, Colors.black,
                                                  FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  );
                }
              },
            ),
    );
  }
}
