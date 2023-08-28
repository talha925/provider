import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavourite extends StatefulWidget {
  const MyFavourite({super.key});

  @override
  State<MyFavourite> createState() => _MyFavouriteState();
}

class _MyFavouriteState extends State<MyFavourite> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteIemProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("My Favourite")),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selectedItems.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteIemProvider>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItems.contains(index)) {
                            value.removeItems(index);
                          } else {
                            value.addItems(index);
                          }
                        },
                        title: Text("Item " + index.toString()),
                        trailing: Icon(value.selectedItems.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
