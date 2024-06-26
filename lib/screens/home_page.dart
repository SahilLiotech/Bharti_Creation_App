import 'package:bharti_creation_app/model/product_model.dart';
import 'package:bharti_creation_app/utils/product_data.dart';
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
          // TODO: Remove unnecessary repetation.
          const SizedBox(
            height: 20,
          ),
          const Text(
            'NamePlates',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          ProductRow(
            products: _namePlateProducts,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'DND Panels',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          ProductRow(
            products: _dndPanelProducts,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'LED Nameplates',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          ProductRow(
            products: _ledNamePlateProducts,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Society Name Boards',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          ProductRow(
            products: _socityNameBoardProducts,
          ),
        ],
      ),
    );
  }
}

class ProductRow extends StatelessWidget {
  final List<Product> products;
  const ProductRow({super.key, required this.products});
  // TODO: add a title: String field that shows title of ProductRow widget

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: products.map((e) => ProductCard(product: e)).toList(),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.asset(
            product.imagePath,
            height: 150,
            width: 150,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
