// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget singalProducts() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 290,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Image.network(
                'https://www.pngkey.com/png/detail/186-1863146_free-png-pizza-png-images-transparent-pizza-png.png'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 1,
                vertical: 1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Chicken Pizza',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'RS 200/small size',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Row(
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Expanded(
                                  child: Text(
                                'piece',
                                style: TextStyle(fontSize: 10),
                              )),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: Colors.yellow,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // ignore: prefer_const_literals_to_create_immutables
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              Icon(
                                Icons.remove,
                                size: 15,
                                color: Color(0xffd0b84c),
                              ),
                              Text(
                                '1',
                                style: TextStyle(
                                  color: Color(0xffd0b84c),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(
                                Icons.add,
                                color: Color(0xffd0b84c),
                                size: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  // Widget listTile({IconData icon, String title}) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 32,
  //     ),
  //     title: Text(title,
  //     style: TextStyle(color:Colors.black45),
  //     ),
  //   );
  // }

  Widget listTile({required String title, required IconData iconData}) {
    return Container(
      height: 50,
      child: ListTile(
        leading: Icon(
          iconData,
          size: 28,
        ),
        title: Text(
          title,
          style: TextStyle(color: Colors.black45),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: Drawer(
        child: Container(
          color: Color(0xffd1ad17),
          child: ListView(
            children: [
              DrawerHeader(
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white54,
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Welcome Guest'),
                        SizedBox(
                          height: 7,
                        ),
                        Container(
                          height: 25,
                          child: OutlineButton(
                              onPressed: () {},
                              child: Text("Login"),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(
                                    width: 2,
                                  ))),
                        )
                      ],
                    )
                  ],
                ),
              ),
              listTile(iconData: Icons.home_outlined, title: "Home"),
              listTile(iconData: Icons.shop_outlined, title: "Review order"),
              listTile(iconData: Icons.person_outline, title: "My Profile"),
              listTile(
                  iconData: Icons.notifications_outlined,
                  title: "Notification"),
              listTile(
                  iconData: Icons.star_outline, title: "Rating and Review"),
              listTile(iconData: Icons.favorite_outline, title: "Wishlist"),
              listTile(
                  iconData: Icons.copy_outlined, title: "Raise a Complant"),
              listTile(iconData: Icons.format_quote_outlined, title: "FAQS"),
              Container(
                height: 350,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('COntact Support '),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Call us: "),
                        SizedBox(
                          width: 10,
                        ),
                        Text("Will be updates soon"),
                      ],
                    ),
                    SizedBox(height: 5),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text("Mail us: "),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Will be updates soon"),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 17),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          CircleAvatar(
            radius: 12,
            backgroundColor: Color(0xffd4d181),
            child: Icon(Icons.search, size: 17, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: CircleAvatar(
              backgroundColor: Color(0xffd6b738),
              radius: 12,
              child: Icon(Icons.camera, size: 17, color: Colors.black),
            ),
          ),
        ],
        backgroundColor: Color(0xffd6b738),
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
                              width: 100,
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

                                    // ignore: prefer_const_literals_to_create_immutables
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
                                color: Colors.white,
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Today"s Special'),
                  Text('View all', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Drink" Special'),
                  Text('View all', style: TextStyle(color: Colors.green)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                  singalProducts(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
