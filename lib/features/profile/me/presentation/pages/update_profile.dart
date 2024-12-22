import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cancel', style: Theme.of(context).textTheme.bodyMedium,),
          ],
        ),
        actions: [
          Container(
            color: Colors.red,
            child: Text('Save', style: Theme.of(context).textTheme.labelMedium)
          )
        ],
      ),
      body: Container(

      ),
    );
  }
}
