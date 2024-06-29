import 'package:bharti_creation_app/model/product_model.dart';
import 'package:bharti_creation_app/screens/product_page.dart';
import 'package:bharti_creation_app/utils/product_data.dart';
import 'package:bharti_creation_app/utils/product_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> _namePlateProducts = [];
  List<Product> _dndPanelProducts = [];
  List<Product> _ledNamePlateProducts = [];
  List<Product> _socityNameBoardProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    await Future.delayed(Duration.zero);
    final namePlateProducts = await ProductData.fetchNamePlate();
    final dndPanelProducts = await ProductData.fetchDndPanel();
    final ledNamePlateProducts = await ProductData.fetchLedNamePlate();
    final socityNameBoardProducts = await ProductData.fetchSocityNameBoard();

    setState(() {
      _namePlateProducts = namePlateProducts;
      _dndPanelProducts = dndPanelProducts;
      _ledNamePlateProducts = ledNamePlateProducts;
      _socityNameBoardProducts = socityNameBoardProducts;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(
            width: screenSize.width,
            child: Image.asset(
              "assets/images/home_screen_pic.png",
              fit: BoxFit.contain,
            ),
          ),
          ProductRow(
            products: _namePlateProducts,
            title: 'Nameplates',
            productType: ProductTypes.nameplates,
          ),
          ProductRow(
            products: _dndPanelProducts,
            title: 'DND Panels',
            productType: ProductTypes.dndPanels,
          ),
          ProductRow(
            products: _ledNamePlateProducts,
            title: "LED Nameplates",
            productType: ProductTypes.ledNameplates,
          ),
          ProductRow(
            products: _socityNameBoardProducts,
            title: 'Society Name Boards',
            productType: ProductTypes.societyNameBoards,
          ),
        ],
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final List<Product> products;
  final ProductTypes productType;
  final String title;
  const ProductRow({
    super.key,
    required this.products,
    required this.title,
    required this.productType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(
                        productType: productType,
                      ),
                    ),
                  );
                },
                icon: const Icon(CupertinoIcons.arrow_right),
                tooltip: "See all $title",
              ),
            ],
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (ctx, idx) {
              return ProductCard(product: products[idx]);
            },
          ),
        ),
      ],
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.imagePath,
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(product.name),
          ],
        ),
      ),
    );
  }
}
