import 'package:buisness_manager/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
class ProductManagement extends StatefulWidget {
  const ProductManagement({super.key});

  @override
  State<ProductManagement> createState() => _ProductManagementState();
}
TextEditingController pnamecontroller=TextEditingController();
TextEditingController costpricecontroller=TextEditingController();
TextEditingController sellingpricecontroller=TextEditingController();
TextEditingController quantitycontroller=TextEditingController();
TextEditingController minimumstockcontroller=TextEditingController();
TextEditingController unitcontroller=TextEditingController();






class _ProductManagementState extends State<ProductManagement> {

  Future<void> _addProducts()async{
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: pnamecontroller,
              decoration: InputDecoration(hintText: "Enter product name",
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))
              ),
            ),
            TextFormField(
              controller: costpricecontroller,
              decoration: InputDecoration(hintText: "Enter Total cost",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),),
            SizedBox(height: 10,),
            TextFormField(
              controller: sellingpricecontroller,
              decoration: InputDecoration(hintText: "Enter selling price",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),),

            SizedBox(height: 10,),
            TextFormField(
              controller: quantitycontroller,
              decoration: InputDecoration(hintText: "Enter total quantity",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),),

            SizedBox(height: 10,),
            TextFormField(
              controller: minimumstockcontroller,
              decoration: InputDecoration(hintText: "Enter minimum stock(for knowing low stock)",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),),

            SizedBox(height: 10,),
            TextFormField(
              controller: unitcontroller,
              decoration: InputDecoration(hintText: "Enter unit",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Cancel")),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("Upload")),

            ],
          )
        ],

      );
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(
        children: [

        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: _addProducts, child: const Icon(Icons.add),),
    );
  }
}
