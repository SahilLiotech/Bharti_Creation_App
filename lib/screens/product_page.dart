import 'package:bharti_creation_app/model/product_model.dart';
import 'package:bharti_creation_app/screens/home_page.dart';
import 'package:bharti_creation_app/utils/product_data.dart';
import 'package:bharti_creation_app/utils/product_types.dart';
import 'package:bharti_creation_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({
    super.key,
    required this.productType,
  });

  final ProductTypes productType;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product>? data;
  bool isLoading = true;

  @override
  initState() {
    super.initState();

    _fetchProducts().then((val) {
      setState(() {
        data = val;
        isLoading = false;
      });
    });
  }

  Future<List<Product>> _fetchProducts() async {
    return switch (widget.productType) {
      ProductTypes.nameplates => ProductData.fetchNamePlate(),
      ProductTypes.ledNameplates => ProductData.fetchLedNamePlate(),
      ProductTypes.dndPanels => ProductData.fetchDndPanel(),
      ProductTypes.societyNameBoards => ProductData.fetchSocityNameBoard(),
    };
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /* 24 is for notification bar on Android */
    final double itemHeight = (size.height - kToolbarHeight - 24) / 3.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: CustomAppBar(title: widget.productType.name),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                children: List.generate(
                  data!.length,
                  (idx) => ProductCard(product: data![idx]),
                ),
              ),
      ),
    );
  }
}
