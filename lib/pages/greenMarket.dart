// import 'package:flutter/material.dart';
//
// class GreenMarketPage extends StatefulWidget {
//   @override
//   _GreenMarketPageState createState() => _GreenMarketPageState();
// }
//
// class _GreenMarketPageState extends State<GreenMarketPage> {
//   List<Map<String, dynamic>> products = [
//     {
//       'name': 'Reusable Water Bottle',
//       'price': '\$15',
//       'image': 'https://images.unsplash.com/photo-1550317138-10000687a72b?w=500',
//     },
//     {
//       'name': 'Solar Lamp',
//       'price': '\$25',
//       'image': 'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=600',
//     },
//     {
//       'name': 'Organic Fertilizer',
//       'price': '\$10',
//       'image': 'https://images.unsplash.com/photo-1562577309-2592ab84b1bc?w=500',
//     },
//     {
//       'name': 'Indoor Plant',
//       'price': '\$20',
//       'image': 'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=500',
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Green Market'),
//         backgroundColor: Colors.green,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             TextField(
//               decoration: InputDecoration(
//                 hintText: 'Search products...',
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.grey[200],
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//
//             // Product List
//             const Text(
//               'Available Products',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.green,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: GridView.builder(
//                 itemCount: products.length,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                 ),
//                 itemBuilder: (context, index) {
//                   final product = products[index];
//                   return _buildProductCard(product, context);
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Show a dialog or navigate to a new page to add a new product
//           _showAddProductDialog(context);
//         },
//         backgroundColor: Colors.green,
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
//
//   Widget _buildProductCard(Map<String, dynamic> product, BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10),
//       ),
//       elevation: 2,
//       child: InkWell(
//         onTap: () {
//           // Navigate to product details or action
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Expanded(
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
//                 child: Image.network(
//                   product['image'],
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   height: 200, // Increased image height
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 children: [
//                   Text(
//                     product['name'],
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   Text(
//                     product['price'],
//                     style: const TextStyle(
//                       fontSize: 14,
//                       color: Colors.green,
//                     ),
//                   ),
//                   const SizedBox(height: 5),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Show eSewa payment dialog
//                       _showPaymentDialog(context, product);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.green,
//                     ),
//                     child: const Text('Buy Now'),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showPaymentDialog(BuildContext context, Map<String, dynamic> product) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Purchase ${product['name']}'),
//           content: const Text('Proceed to payment with eSewa?'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Integrate eSewa payment here
//                 Navigator.of(context).pop();
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(
//                     content: Text('Payment for ${product['name']} initiated!'),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//               child: const Text('Pay with eSewa'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showAddProductDialog(BuildContext context) {
//     final TextEditingController nameController = TextEditingController();
//     final TextEditingController priceController = TextEditingController();
//     final TextEditingController imageController = TextEditingController();
//
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Add New Product'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 controller: nameController,
//                 decoration: const InputDecoration(hintText: 'Product Name'),
//               ),
//               TextField(
//                 controller: priceController,
//                 decoration: const InputDecoration(hintText: 'Price'),
//               ),
//               TextField(
//                 controller: imageController,
//                 decoration: const InputDecoration(hintText: 'Image URL'),
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: const Text('Cancel'),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   products.add({
//                     'name': nameController.text,
//                     'price': priceController.text,
//                     'image': imageController.text,
//                   });
//                 });
//                 Navigator.of(context).pop();
//                 // Refresh the UI with the new product
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//               child: const Text('Add Product'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//

import 'package:flutter/material.dart';



class GreenMarketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Green Market'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Eco-Friendly Products'),
              Tab(text: 'Sustainable Alternatives'),
              Tab(text: 'Local Vendors'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            EcoFriendlyProductMarketplace(),
            SustainableAlternatives(),
            LocalVendors(),
          ],
        ),
      ),
    );
  }
}

class EcoFriendlyProductMarketplace extends StatefulWidget {
  @override
  _EcoFriendlyProductMarketplaceState createState() =>
      _EcoFriendlyProductMarketplaceState();
}

class _EcoFriendlyProductMarketplaceState
    extends State<EcoFriendlyProductMarketplace> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  List<String> productImages = [
    'https://images.unsplash.com/photo-1550317138-10000687a72b?w=500',
    'https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&q=80&w=600',

    'https://images.unsplash.com/photo-1562577309-2592ab84b1bc?w=500',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=500',
    'https://images.unsplash.com/photo-1501004318641-b39e6451bec6?w=500',

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            decoration: InputDecoration(
              labelText: 'Search Products',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (query) {
              setState(() {
                searchQuery = query;
              });
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 250, // Set fixed height for each card
            ),
            itemCount: productImages.length,
            itemBuilder: (context, index) {
              String productImage = productImages[index];
              return productImage.contains(searchQuery) || searchQuery.isEmpty
                  ? Card(
                elevation: 5,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        productImage,
                        fit: BoxFit.cover,
                        height: 120, // Adjusted image height
                        width: double.infinity,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                  (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Product $index',
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 5),
                          Text('\$20.00'),
                          ElevatedButton(
                            onPressed: () {
                              _showPaymentMethodDialog(context);
                            },
                            child: Text('Buy'),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
                  : Container();
            },
          ),
        ),
      ],
    );
  }

  void _showPaymentMethodDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Payment Method'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('eSewa'),
                leading: Icon(Icons.payment),
                onTap: () {
                  Navigator.pop(context);
                  _showPaymentSuccessDialog(context, 'eSewa');
                },
              ),
              ListTile(
                title: Text('Cash on Delivery'),
                leading: Icon(Icons.money),
                onTap: () {
                  Navigator.pop(context);
                  _showPaymentSuccessDialog(context, 'Cash on Delivery');
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showPaymentSuccessDialog(BuildContext context, String method) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Payment Successful'),
          content: Text('Payment via $method has been successfully processed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class SustainableAlternatives extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Sustainable Alternatives Page'),
    );
  }
}

class LocalVendors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Local Vendors Page'),
    );
  }
}