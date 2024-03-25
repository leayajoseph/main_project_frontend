import 'package:flutter/material.dart';
import 'package:villagezone/features/home/homeGridView.dart';
import 'package:villagezone/features/home/screens/category_products.dart';
import 'package:villagezone/models/CategoryModel.dart';
import 'package:villagezone/services/ViewCategoryService.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  Future<List<ViewCategory>>? data;

  @override
  void initState() {
    super.initState();
    data = CategoryApiService().getCategory();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  "assets/villageZone.jpg",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 500,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Text('Search here'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Top Categories",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 100,
                  child: FutureBuilder(
                    future: data,
                    builder: (context, snapshot) {
                      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String img_url =
                                "http://192.168.43.30:3001/" +
                                    snapshot.data![index].categoryIcon
                                        .toString();
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CategoryProduct(
                                        categoryId: snapshot.data![index].id,
                                      categoryName: snapshot.data![index].categoryName
                                    )
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 30),
                                child: Column(
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 70,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius:
                                        BorderRadius.circular(120),
                                      ),
                                      child: Center(
                                        child:
                                        Image(image: NetworkImage(img_url)),
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    SizedBox(
                                      width: 55,
                                      child: Text(
                                        snapshot.data![index].categoryName
                                            .toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Text("Loading");
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridViewHome(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


