// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/product_overview/product_overview.dart';
import 'package:canteen_app/providers/product_provider.dart';
import 'package:canteen_app/providers/user_provider.dart';
import 'package:canteen_app/review_cart/review_cart.dart';
import 'package:canteen_app/screens/home/drawer_side.dart';
import 'package:canteen_app/screens/home/singal_product.dart';
import 'package:canteen_app/search/search.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProductProvider productProvider;

  Widget _buildTodayProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Today"s Food'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getTodayproductDataList,
                    ),
                  ));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getTodayproductDataList.map(
              (todayproductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          // productQuantity: todayproductData.prof,
                          productId: todayproductData.id,
                          productPrice: todayproductData.productPrice,
                          productName: todayproductData.productName,
                          productImage: todayproductData.productImage,
                          productQuantity: "",
                        ),
                      ),
                    );
                  },
                  productId: todayproductData.id,
                  productprice: todayproductData.productPrice,
                  productImage: todayproductData.productImage,
                  productName: todayproductData.productName,
                  productUnit: todayproductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildDrinkProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Drinks Special'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.getdrinkproductDataList,
                    ),
                  ));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getdrinkproductDataList.map(
              (todayproductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productId: todayproductData.id,
                          productPrice: todayproductData.productPrice,
                          productName: todayproductData.productName,
                          productImage: todayproductData.productImage,
                          productQuantity: "",
                        ),
                      ),
                    );
                  },
                  productId: todayproductData.id,
                  productprice: todayproductData.productPrice,
                  productImage: todayproductData.productImage,
                  productName: todayproductData.productName,
                  productUnit: todayproductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildVegProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Drinks Special'),
              // Text(
              //   'view all',
              //   style: TextStyle(color: Colors.grey),
              // ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Search(
                      search: productProvider.famousProductList,
                    ),
                  ));
                },
                child: Text(
                  'view all',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getfamousproductDataList.map(
              (todayproductData) {
                return SingalProduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productQuantity: "",
                          productId: todayproductData.id,
                          productPrice: todayproductData.productPrice,
                          productName: todayproductData.productName,
                          productImage: todayproductData.productImage,
                        ),
                      ),
                    );
                  },
                  productId: todayproductData.id,
                  productprice: todayproductData.productPrice,
                  productImage: todayproductData.productImage,
                  productName: todayproductData.productName,
                  productUnit: todayproductData,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fatchTodayProductData();
    productProvider.fatchdrinkProductData();
    productProvider.fatchfamousProductData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);
    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();
    return Scaffold(
      // backgroundColor: Color(0xff0c0f14),
      backgroundColor: Colors.white,
      drawer: DrawerSide(userProvider: userProvider),
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        actions: [
          CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xffd6d382),
            child: IconButton(
              // onPressed: () {
              //   Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => Search(),
              //   ));
              // },
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Search(
                    search: productProvider.getAllProductSearch,
                  ),
                ));
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: textColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
              child: CircleAvatar(
                backgroundColor: primaryColor,
                radius: 12,
                child: Icon(
                  Icons.shop,
                  size: 17,
                  color: textColor,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1499028344343-cd173ffc68a9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTh8fHxlbnwwfHx8fA%3D%3D&w=1000&q=80'),
                  ),
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      //color: Colors.red,
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 150, bottom: 10),
                            child: Container(
                              height: 50,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Color(0xffd1ad17),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(50),
                                    bottomLeft: Radius.circular(50)),
                              ),
                              child: Center(
                                child: Text(
                                  'Food',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 3,
                                          offset: Offset(3, 3))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '30% Off',
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'On all chicken products',
                              style: TextStyle(
                                color: scaffoldBackgroundColor,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ),
            _buildTodayProduct(context),
            _buildDrinkProduct(context),
            _buildVegProduct(context),
          ],
        ),
      ),
    );
  }
}
