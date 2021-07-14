import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/models/models.dart';

class EmptyGroceryScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/empty_shopping.jpg', width: 150, height: 150, fit: BoxFit.cover,),
            const SizedBox(height: 15),
            const Text('No Groceries',
              style: TextStyle(fontSize: 21.0),),

            const SizedBox(height: 16.0),
            const Text(
              'Shopping for ingredients?\n'
                  'Tap the + button to write them down!' ,
              textAlign: TextAlign.center,
            ),

            MaterialButton(
              textColor: Colors.white,
              child: const Text('Browse Recipes'),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),),
              color: Colors.green,
              onPressed: () {
                Provider.of<TabManager>(context, listen: false).goToGridView();
              },),

          ],
        ),
      ),
    );
  }

}