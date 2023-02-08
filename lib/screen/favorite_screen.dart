import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerexample/provider/favorite_provider.dart';
import 'package:providerexample/screen/myFavourite.dart';

class favoriteScreen extends StatefulWidget {
  const favoriteScreen({Key? key}) : super(key: key);

  @override
  State<favoriteScreen> createState() => _favoriteScreenState();
}

class _favoriteScreenState extends State<favoriteScreen> {
  List<int> selectedItem=[];
  @override
  Widget build(BuildContext context) {
   // final favouriteProvider=Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar:AppBar(
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>MyFavouriteItemScreen()));
            },
              child: Icon(Icons.favorite)),
          SizedBox(width: 10,)
        ],
      ),
      body: Column(
        children: [Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context,index){
                  return Consumer<FavouriteItemProvider>(
                    builder: (context,value,child){
                      return ListTile(
                        onTap: (){
                          
                          if (value.selectedItem.contains(index))
                            {
                              value.removeItem(index);
                            }
                          else{
                            value.addItem(index);
                          }

                          // setState(() {
                          //
                          // });
                        },
                        title: Text('item'+index.toString()),
                        trailing: Icon(
                            value.selectedItem.contains(index)? Icons.favorite:Icons.favorite_border_outlined,color: Colors.red,),
                      );
                    },

                  );
                }

            ),
          )
        ],
      ),
    );
  }
}
