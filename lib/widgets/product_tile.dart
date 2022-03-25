import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_flutter_app/models/product.dart';


class ProductTile extends StatelessWidget {
  final ProductsModel product;
  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Container(
        height: MediaQuery.of(context).size.height/4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 100,
                        width: double.infinity,
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                  child: Image.network(product.image!,
                  fit: BoxFit.cover,)),
              // Stack(
              //   children: [
              //     NetworkImage(product.image),
              //     // Container(
              //     //   height: 180,
              //     //   width: double.infinity,
              //     //   clipBehavior: Clip.antiAlias,
              //     //   decoration: BoxDecoration(
              //     //     borderRadius: BorderRadius.circular(4),
              //     //   ),
              //     //   child: NetworkImage(
              //     //     product.image,
              //     //
              //     //   ),
              //     // ),
              //     Positioned(
              //       right: 0,
              //       child: Obx(() => CircleAvatar(
              //             backgroundColor: Colors.white,
              //             child: IconButton(
              //               icon: product.rating != null
              //                   ? Icon(Icons.favorite_rounded)
              //                   : Icon(Icons.favorite_border),
              //               onPressed: () {
              //                 product.rating;
              //               },
              //             ),
              //           )),
              //     )
              //   ],
              // ),
              SizedBox(height: 8),
              Text(
                product.title!,
                maxLines: 4,
                style:
                  GoogleFonts.abel(fontSize: 16,color: Colors.grey),
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height:6),
              if (product.rating != null)
                Container(

                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical:4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.star,
                        size: 16,
                        color: Colors.white,
                      ),
                      SizedBox(width: 2,),
                      Text(
                        product.rating!.rate.toString(),
                        style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),
                      ),

                    ],
                  ),
                ),

              Text('\$${product.price}',
                  style: GoogleFonts.alef(fontWeight: FontWeight.bold,fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
