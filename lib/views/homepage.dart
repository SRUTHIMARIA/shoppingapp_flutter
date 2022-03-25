import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_flutter_app/controllers/product_controller.dart';
import '../widgets/product_tile.dart';

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 75.0,
        backgroundColor: Colors.indigo,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Discover Fashion',
          style: GoogleFonts.anticDidone(fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_outline,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text('Our Products',
                      style: GoogleFonts.alikeAngular(fontSize: 24)),
                ),
                IconButton(
                    icon: Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: Icon(Icons.grid_view), onPressed: () {}),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                        decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search Products',
                      hintStyle: GoogleFonts.aBeeZee(),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 24,
                      ),
                    )))),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: (7 / 9),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2),
                  itemCount: productController.productList.length,
                  itemBuilder: (context, index) {
                    if (productController.productList.isNotEmpty) {
                      return ProductTile(productController.productList[index]);
                    } else
                      return Container();
                  },
                );
              }

              //   StaggeredGridView.countBuilder(
              //   crossAxisCount: 2,
              //   itemCount: productController.productList.length,
              //   crossAxisSpacing: 16,
              //   mainAxisSpacing: 16,
              //   itemBuilder: (context, index) {
              //     return ProductTile(productController.productList[index]);
              //   },
              //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              // );
            }),
          )
        ],
      ),
    );
  }
}
