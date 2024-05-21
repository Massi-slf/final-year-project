import 'package:online_shop/views/shared/export.dart';
import 'package:online_shop/views/shared/export_packages.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    var authNotifier = Provider.of<FavoritesNotifier>(context);
    var favoritesNotifier = Provider.of<FavoritesNotifier>(context);
    // List<dynamic> fav = [];
    // final favData = _favBox.keys.map((key){
    //   final item = _favBox.get(key);
    //   return{
    //     "key" : key,
    //     "id" : item['id'],
    //     "category" : item['category'],
    //     "name" : item['name'],
    //     "imageUrl" : item['imageUrl'],
    //     "price" : item['price'],
    //   };
    // }).toList();
    favoritesNotifier.getAllData();
    return Scaffold(
        backgroundColor: const Color(0xFFE2E2E2),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16.w, top: 45.h),
                height: 325.h,
                width: 375.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/top_image.png"),
                        fit: BoxFit.fill)),
                child: Padding(
                  padding: EdgeInsets.all(8.h),
                  child: reusableText(
                    text: "Favorites",
                    style: appstyle(40, Colors.white, FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.h),
                child: ListView.builder(
                  itemCount: favoritesNotifier.fav.length,
                  padding: EdgeInsets.only(top: 100.h),
                  itemBuilder: (BuildContext context, int index) {
                    final shoe = favoritesNotifier.fav[index];
                    return Padding(
                      padding: EdgeInsets.all(8.h),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.h),
                        ),
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
                                      imageUrl: shoe['imageUrl'],
                                      width: 70.w,
                                      height: 70.h,
                                      fit: BoxFit.fill,
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
                                          text: shoe['name'],
                                          style: appstyle(16, Colors.black,
                                              FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        reusableText(
                                          text: shoe['category'],
                                          style: appstyle(
                                              14, Colors.grey, FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        reusableText(
                                          text: shoe['price'],
                                          style: appstyle(16, Colors.black,
                                              FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.h),
                                child: GestureDetector(
                                  onTap: () {
                                    favoritesNotifier.deleteFav(shoe['key']);
                                    favoritesNotifier.ids.removeWhere(
                                        (element) => element == shoe['id']);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                  },
                                  child: const Icon(Ionicons.md_heart_dislike),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
