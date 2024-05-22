import 'package:online_shop/client/views/shared/export.dart';
import 'package:online_shop/client/views/shared/export_packages.dart';


class ProductByCat extends StatefulWidget {
  const ProductByCat({super.key, required this.tabIndex});

  final int tabIndex;

  @override
  State<ProductByCat> createState() => _ProductByCatState();
}

class _ProductByCatState extends State<ProductByCat>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  @override
  void initState() {
    super.initState();
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var productNotifier = Provider.of<ProductNotifier>(context);
    productNotifier.getFemale();
    productNotifier.getMale();
    productNotifier.getkids();
    return Scaffold(
      backgroundColor: const Color(0xFFE2E2E2),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 16.w, top: 45.h),
              height: 325.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/top_image.png"),
                      fit: BoxFit.fill)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(6.w, 12.h, 16.w, 18.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            AntDesign.close,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            filter();
                          },
                          child: const Icon(
                            FontAwesome.sliders,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle: appstyle(24, Colors.white, FontWeight.bold),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kids Shoes",
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 142.h, left: 16.w, right: 12.w),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: TabBarView(controller: _tabController, children: [
                  latestShoes(male: productNotifier.male),
                  latestShoes(male: productNotifier.female),
                  latestShoes(male: productNotifier.kids),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double value = 100;
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        builder: (context) => Container(
              height: 680.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.h),
                    topRight: Radius.circular(25.h),
                  )),
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 5.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.h)),
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 600.h,
                    child: ListView(
                      children: [
                        Column(
                          children: [
                            const CustomSpacer(),
                            Text(
                              "Filter",
                              style:
                                  appstyle(40, Colors.black, FontWeight.bold),
                            ),
                            const CustomSpacer(),
                            Text(
                              "Gender",
                              style:
                                  appstyle(20, Colors.black, FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                CategoryBtn(
                                  label: "Men",
                                  buttonClr: Colors.black,
                                ),
                                CategoryBtn(
                                  label: "Women",
                                  buttonClr: Colors.grey,
                                ),
                                CategoryBtn(
                                  label: "Kids",
                                  buttonClr: Colors.grey,
                                ),
                              ],
                            ),
                            const CustomSpacer(),
                            Text(
                              "Category",
                              style:
                                  appstyle(20, Colors.black, FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              children: [
                                CategoryBtn(
                                  label: "Shoes",
                                  buttonClr: Colors.black,
                                ),
                                CategoryBtn(
                                  label: "Apparrels",
                                  buttonClr: Colors.grey,
                                ),
                                CategoryBtn(
                                  label: "Accessories",
                                  buttonClr: Colors.grey,
                                ),
                              ],
                            ),
                            const CustomSpacer(),
                            reusableText(
                                text: "Price",
                                style: appstyle(
                                    20, Colors.black, FontWeight.bold)),
                            const CustomSpacer(),
                            Slider(
                                value: value,
                                activeColor: Colors.black,
                                inactiveColor: Colors.grey,
                                thumbColor: Colors.black,
                                max: 500,
                                divisions: 50,
                                label: value.toString(),
                                //secondaryTrackValue: 200,
                                onChanged: (double value) {}),
                            const CustomSpacer(),
                            reusableText(
                                text: "Brand",
                                style: appstyle(
                                    20, Colors.black, FontWeight.bold)),
                            SizedBox(
                              height: 20.h,
                            ),
                            Container(
                              padding: EdgeInsets.all(8.h),
                              height: 80.h,
                              child: ListView.builder(
                                  itemCount: brand.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.all(8.h),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey.shade200,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.h))),
                                        child: Image.asset(
                                          brand[index],
                                          height: 70.h,
                                          width: 80.w,
                                          fit: BoxFit.contain,
                                          color: Colors.black,
                                        ),
                                      ),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
  }
}
