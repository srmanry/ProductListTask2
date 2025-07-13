
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:productlist/feature/home/controller/product_controller.dart';
import 'package:productlist/feature/shimmer/home_view_shimmer.dart';
import 'package:productlist/theme/dark_theme.dart';
import 'package:productlist/theme/light_theme.dart';



class HomeScreenView extends StatelessWidget {
   HomeScreenView({super.key});
   final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: lightTheme.cardColor,
      appBar: AppBar(backgroundColor: darkTheme.primaryColor, centerTitle: true,
          title: Text('Fake Store',style: TextStyle(color: Colors.white),)),

      body: Padding(padding: const EdgeInsets.all(8.0),
        child: Column(children: [
            Padding( padding: EdgeInsets.all(8),
              child: TextField(
                keyboardType: TextInputType.webSearch,textInputAction:TextInputAction.search ,
                decoration: InputDecoration(  hintText: 'Enter Product Name',
                  prefixIcon: Icon(Icons.search),  border: OutlineInputBorder(),  ),
                  onChanged: controller.onSearchChanged,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Obx(() => DropdownButton<String>(
                  value: controller.selectedCategory.value,
                  isExpanded: true,items: controller.categories.map((cat) =>
                  DropdownMenuItem(value: cat, child: Text(cat))).toList(), onChanged: controller.onCategoryChanged,
              )),
            ),
Expanded(
  child: Obx((){return !controller.isLoading.value?
  const HomeViewShimmer(height: 200,width: 200,):

  Obx(
    ()=> GridView.builder(
      itemCount: controller.filteredList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, mainAxisExtent: 260,
        crossAxisSpacing: 8,mainAxisSpacing: 8,),
        itemBuilder: (context, index) {
        final product = controller.filteredList[index];
        return Card(color: lightTheme.cardColor,child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child:
              Padding(padding: const EdgeInsets.all(8.0),
                    child: Image.network(product.image, fit: BoxFit.contain,  ),),),
              Padding(padding: const EdgeInsets.all(8.0),
                child: Text(
                  product.title, maxLines: 2, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text("\$${product.price}", style: TextStyle(color: Colors.green), ),),
            ],
          ),
        );
      },
    ),
  );})),
        ],
        ),
      ),
    );
  }

  }



