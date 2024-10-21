import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/provider/product_provider.dart';
import 'package:shopping_provider/widgets/category_header.dart';
import 'package:shopping_provider/widgets/product.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: size.height * 0.005),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shop Now',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * 0.050,
                            letterSpacing: 0.5,
                          ),
                        ),
                        Text(
                          'Your Favorite products.',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: size.width * 0.040,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: size.width * 0.060,
                      foregroundImage: const AssetImage('assets/profile3.jpg'),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.025,
                ),
                SizedBox(
                  width: size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                      focusColor: Colors.black38,
                      isCollapsed: false,
                      hintText: 'Search Products',
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: GoogleFonts.poppins(
                        fontSize: size.width * 0.040,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.01,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: const BorderSide(
                          color: Colors.black26,
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/cover.jpg',
                    height: size.height * 0.2,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Column(
                  children: [
                    CategoryHeader(
                      title: 'T-Shirts',
                      count:
                          '${Provider.of<ProductProvider>(context).shirts.length}',
                    ),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Consumer<ProductProvider>(
                        builder: (context, value, child) {
                          return Row(
                            children: value.shirts
                                .map((product) => Product(product: product))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Column(
                  children: [
                    CategoryHeader(
                      title: 'pants',
                      count:
                      '${Provider.of<ProductProvider>(context).pants.length}',
                    ),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Consumer<ProductProvider>(
                        builder: (context, value, child) {
                          return Row(
                            children: value.pants
                                .map((product) => Product(product: product))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.030,
                ),
                Column(
                  children: [
                    CategoryHeader(
                      title: 'Nike Shoes',
                      count:
                      '${Provider.of<ProductProvider>(context).shoes.length}',
                    ),
                    SizedBox(
                      height: size.height * 0.020,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Consumer<ProductProvider>(
                        builder: (context, value, child) {
                          return Row(
                            children: value.shoes
                                .map((product) => Product(product: product))
                                .toList(),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
