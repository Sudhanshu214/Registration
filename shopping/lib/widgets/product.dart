import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/models/product_model.dart';
import 'package:shopping_provider/provider/cart_provider.dart';
import 'package:shopping_provider/provider/product_provider.dart';

import '../screens/product screen/product_screen.dart';

class Product extends StatefulWidget {
  const Product({super.key, required this.product});

  final ProductModel product;

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productProvider = Provider.of<ProductProvider>(context);

    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: SizedBox(
        width: size.width * 0.50,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white60,
                        spreadRadius: 0.5,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) =>
                                ProductScreen(product: widget.product),
                          ),
                        );
                      },
                      child: Image.asset(
                        widget.product.image,
                        fit: BoxFit.contain,
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: widget.product.isAvailable
                      ? GestureDetector(
                          onTap: () {
                            //add or remove from favorites
                            productProvider.toggleFavorite(widget.product);
                          },
                          child: Icon(
                            widget.product.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            size: size.width * 0.05,
                            color: widget.product.isFavorite
                                ? Colors.redAccent
                                : Colors.black,
                          ),
                        )
                      : const SizedBox(),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.020,
            ),
            Text(
              widget.product.name,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                fontSize: size.width * 0.033,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            SizedBox(
              child: widget.product.isAvailable
                  ? Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color(0xff03B680),
                          radius: 4,
                        ),
                        SizedBox(
                          width: size.width * 0.020,
                        ),
                        Text(
                          //widget.product.name,
                          'Available',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.033,
                            color: const Color(0xff03B680),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        const CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          radius: 4,
                        ),
                        SizedBox(
                          width: size.width * 0.020,
                        ),
                        Text(
                          //widget.product.name,
                          'Out of Stock',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: size.width * 0.033,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
            ),
            SizedBox(
              width: size.width * 0.020,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ ${widget.product.price}',
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: size.width * 0.040,
                  ),
                ),
                widget.product.isAvailable
                    ? GestureDetector(
                        onTap: () {
                          context
                              .read<CartProvider>()
                              .addToCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: Colors.green,
                              content: Text(
                                'Item Added !!.',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 13,
                          child: Icon(
                            CupertinoIcons.cart_fill_badge_plus,
                            size: size.width * 0.065,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
