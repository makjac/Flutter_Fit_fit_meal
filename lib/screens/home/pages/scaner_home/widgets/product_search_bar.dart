import 'package:flutter/material.dart';

import '../../../../../utils/insets.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
            topLeft: Radius.circular(20),
          ),
          border: Border.all(color: Colors.white, width: 3)),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Insets.s,
              ),
              child: TextFormField(
                cursorColor: Colors.white,
                style: const TextStyle(color: Colors.white, fontSize: 17),
                autocorrect: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product name",
                  hintStyle: TextStyle(color: Colors.white.withOpacity(0.8)),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.s),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
