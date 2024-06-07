import 'package:bharti_creation_app/model/product_model.dart';
import 'package:bharti_creation_app/utils/product_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: screenSize.width,
              child: Image.asset(
                "assets/images/home_screen_pic.png",
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),
            _buildProductSection('Name Plate', _namePlateProducts),
            const SizedBox(height: 20),
            _buildProductSection('DND Panel', _dndPanelProducts),
            const SizedBox(height: 20),
            _buildProductSection('LED Name Plate', _ledNamePlateProducts),
            const SizedBox(height: 20),
            _buildProductSection('Society Dashboard', _socityNameBoardProducts),
          ],
        ),
      ),
    );
  }

  Widget _buildProductSection(String title, List<Product> products) {
    final screenSize = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.01),
          child: Text(
            title,
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  color: Colors.grey[300],
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    child: Column(
                      children: [
                        Image.asset(
                          product.imagePath,
                          height: 150,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('₹${product.price}'),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
