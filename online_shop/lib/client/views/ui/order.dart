import 'package:online_shop/client/model/orders/orders_req.dart';
import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';
import 'package:online_shop/client/widgets/reusable_text.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    AntDesign.close,
                    color: Colors.black,
                  ),
                ),
                reusableText(
                  text: "My Orders",
                  style: appstyle(36, Colors.black, FontWeight.bold),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 528.h,
                  child: ListView.builder(
                      itemCount: cartProvider.cart.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = cartProvider.cart[index];
                        return Padding(
                          padding: EdgeInsets.all(8.h),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.h)),
                            child: Container(
                              height: 95.h,
                              width: 375.w,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.shade500,
                                        spreadRadius: 5,
                                        blurRadius: 0.3,
                                        offset: const Offset(0, 1)),
                                  ]),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Stack(
                                        clipBehavior: Clip.none,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(12.h),
                                            child: CachedNetworkImage(
                                              imageUrl: data['imageUrl'],
                                              width: 50.w,
                                              height: 50.h,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -2.h,
                                              child: GestureDetector(
                                                onTap: () {
                                                  cartProvider
                                                      .deleteCart(data['key']);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MainScreen()));
                                                },
                                                child: Container(
                                                  width: 30.h,
                                                  height: 20.h,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      12.h))),
                                                  child: Icon(
                                                    AntDesign.delete,
                                                    size: 20.h,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: 12.h, left: 20.w),
                                        child: Column(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            reusableText(
                                              text: data['name'],
                                              style: appstyle(16, Colors.black,
                                                  FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            reusableText(
                                              text: data['category'],
                                              style: appstyle(14, Colors.grey,
                                                  FontWeight.w600),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                reusableText(
                                                  text: "\$${data['price']}",
                                                  style: appstyle(
                                                      12,
                                                      Colors.black,
                                                      FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  width: 30.w,
                                                ),
                                                reusableText(
                                                  text:
                                                      "Size   ${data['sizes']}",
                                                  style: appstyle(
                                                      10,
                                                      Colors.grey,
                                                      FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.black12,
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                    
                                    ),

                                    child: Row(
                                      
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(16))),
                                            child: Row(
                                              children: [
                                                const Icon(MaterialCommunityIcons
                                                    .truck_fast_outline,
                                                    size: 16,),
                                                    SizedBox(width: 10.h,),
                                                    ReusableText(text: 'PENDING', style: appstyle(8, Colors.black, FontWeight.w600))
                                              ],
                                            ),
                                          ),
                                        ),
                                    
                                        // ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
