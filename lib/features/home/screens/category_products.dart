import 'package:flutter/material.dart';
import 'package:villagezone/models/productModel.dart';
import 'package:villagezone/services/ProductService.dart';

class CategoryProduct extends StatefulWidget {
  final String categoryId;
  final String categoryName;

  const CategoryProduct({required this.categoryId, required this.categoryName,Key? key}) : super(key: key);


  @override
  State<CategoryProduct> createState() => _CategoryProductState();
}

class _CategoryProductState extends State<CategoryProduct> {
  Future<List<ViewProduct>> ?data;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data=ProductApiService().getProductByCategory(widget.categoryId);
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(onPressed: (){},
                  icon: Image.asset("assets/villageZone.jpg",
                    height: 50,width: 50,
                    fit: BoxFit.cover,) ),
              IconButton(onPressed:(){},
                  icon: Icon(Icons.shopping_cart))
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
                        border: Border.all(color: Colors.grey)
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search,color: Colors.grey,),
                        SizedBox(width: 10,),
                        Text('Search here'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          IconButton(onPressed: ()
                          {
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_back)),
                          Text(widget.categoryName,style: TextStyle(fontSize: 20),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: FutureBuilder(
                          future: data,
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                              return GridView.builder(
                                itemCount: snapshot.data!.length,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.6667,
                                  crossAxisCount: 2,
                                ),
                                itemBuilder: (context, index) {
                                  List<String> imagePaths =
                                  snapshot.data![index].productImg.split(',');
                                  List<String> fullImagePaths = imagePaths
                                      .map((path) => "http://192.168.29.217:3001/$path")
                                      .toList();
                                  return InkWell(
                                    onTap: () {},
                                    child: Container(
                                      height: 300,
                                      width: 200,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 4,
                                            spreadRadius: 2,
                                          )
                                        ],
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  snapshot.data![index].discount + "% off",
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                //Icon(Icons.favorite,color: Colors.redAccent,)
                                              ],
                                            ),
                                            SizedBox(height: 5),
                                            if (fullImagePaths.isNotEmpty)
                                              Image.network(
                                                fullImagePaths.first,
                                                height: 100,
                                                width: 100,
                                              ),
                                            SizedBox(height: 5,),
                                            Padding(
                                              padding: EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(snapshot.data![index].productName,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 14,
                                                      color: Colors.black.withOpacity(0.8),
                                                    ),
                                                    textAlign: TextAlign.center,),
                                                  SizedBox(height: 5,),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "₹"+snapshot.data![index].discountPrice,
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.redAccent,
                                                          fontWeight: FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(width: 5,),
                                                      Text(
                                                        "₹"+snapshot.data![index].price,
                                                        style: TextStyle(
                                                            decoration: TextDecoration.lineThrough,
                                                            fontSize: 13,
                                                            color: Colors.black.withOpacity(0.4)
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),)
                                          ],
                                        ),
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
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
