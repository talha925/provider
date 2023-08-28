import 'package:flutter/material.dart';
import 'package:myapp/provider/favourite_provider.dart';
import 'package:myapp/screens/favourite/my_favourite.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  List<int> selectedItems = [];
  @override
  Widget build(BuildContext context) {
    // print("build");
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Favourite App")),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyFavourite()));
            },
            child: const Icon(Icons.favorite),
          ),
          const SizedBox(
            width: 4,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100,
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
