
// import 'package:flutter/material.dart';
// import 'package:farm/common/widgets/loader.dart';
// import 'package:farm/features/admin/screens/add_product_screen_admin.dart';
// import 'package:farm/features/admin/service/admin_services.dart';
// import 'package:farm/features/auth/widgets/single_product.dart';
// import 'package:farm/models/product.dart';

// class PostsScreen extends StatefulWidget {
//   const PostsScreen({Key? key}) : super(key: key);

//   @override
//   State<PostsScreen> createState() => _PostsScreenState();
// }

// class _PostsScreenState extends State<PostsScreen> {
//   List<Product>? products;
//   final AdminServices adminServices = AdminServices();



//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetchAllProducts();
//   // }

//   // fetchAllProducts() async {
//   //   products = await adminServices.fetchAllProducts(context);
//   //   setState(() {});
//   // }

//   // void deleteProduct(Product product, int index) {
//   //   adminServices.deleteProduct(
//   //     context: context,
//   //     product: product,
//   //     onSuccess: () {
//   //       products!.removeAt(index);
//   //       setState(() {});
//   //     },
//   //   );
//   // }

//   // void navigateToAddProduct() {
//   //   Navigator.pushNamed(context, AddProductScreenAdmin.routeName);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return products == null
//         ? const Loader()
//         : Scaffold(
//             body: GridView.builder(
//               itemCount: products!.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemBuilder: (context, index) {
//                 final productData = products![index];
//                 return Padding(
//                   padding: EdgeInsets.only(top: 8),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 140,
//                         child: SingleProduct(
//                           image: productData.images[0],
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 13),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                           children: [
//                             // Expanded(
//                             //   child: Text(
//                             //     productData.shopName,
//                             //     overflow: TextOverflow.ellipsis,
//                             //     maxLines: 2,
//                             //   ),
//                             // ),
//                             IconButton(
//                               onPressed: () {},
//                               // => deleteProduct(productData, index),
//                               icon: const Icon(
//                                 Icons.delete_outline,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//             floatingActionButton: FloatingActionButton(
//               child: const Icon(Icons.add),
//               onPressed: navigateToAddProduct,
//               tooltip: 'Add a Product',
//             ),
//             floatingActionButtonLocation:
//                 FloatingActionButtonLocation.centerFloat,
//           );
//   }
// }



import 'package:flutter/material.dart';
import 'package:farm/common/widgets/loader.dart';
import 'package:farm/features/admin/service/admin_services.dart';
import 'package:farm/features/auth/widgets/single_product.dart';
import 'package:farm/models/product.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  List<Product>? products;
  final AdminServices adminServices = AdminServices();



  @override
  void initState() {
    super.initState();
    fetchAllProducts();
  }

  fetchAllProducts() async {
    products = await adminServices.fetchAllProducts(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return products == null
        ? const Loader()
        : Scaffold(
            body: GridView.builder(
              itemCount: products!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                final productData = products![index];
                return Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                        child: SingleProduct(
                          image: productData.name,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Text(
                                productData.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              // => deleteProduct(productData, index),
                              icon: const Icon(
                                Icons.delete_outline,
                              ),
                            ),  
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}