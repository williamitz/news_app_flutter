import 'package:flutter/material.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/providers/articles_provider.dart';
import 'package:news_app/widgets/list_news.dart';
import 'package:provider/provider.dart';

class Tabs2Screen extends StatelessWidget {
  const Tabs2Screen({super.key});

  @override
  Widget build(BuildContext context) {

    final ArticlesProvider articleprov = Provider.of<ArticlesProvider>(context); 

    return SafeArea(
      
      child: Scaffold(
        body: Column(
        children: [
          
          _ListCategory(
            categories: articleprov.categories, 
            countcategory: articleprov.countcategory,
            categorieSlc: articleprov.selectedCaregory,
          ),

          if( articleprov.loadingByCategory ) 
            Container(
              child: Column(
                children: const [
                  SizedBox( height: 300, ),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          
          if( !articleprov.loadingByCategory ) 
            Expanded(
              child: ListNews(articles: articleprov.headlinesByCategory)
            )
        ],
      ),
      ),

    );
  }
}



class _ListCategory extends StatelessWidget {

  final int countcategory;
  final List<CategoryModel> categories;
  final String categorieSlc;

  const _ListCategory({
    Key? key, 
    required this.countcategory, required this.categories, required this.categorieSlc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final articleprov = Provider.of<ArticlesProvider>( context );
    // final categories = articleprov.categories;

    // final categories = Provider.of<ArticlesProvider>(context).categories;

    return Container(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: countcategory,
        itemBuilder: (BuildContext _, int i) {
    
          final element = categories[i];
          final name = element.category;
    
          return Container(
            width: 120,
            padding: const EdgeInsets.all( 10 ),
            // margin: const EdgeInsets.symmetric( horizontal: 10 ),
            child: Column(
              children: [
    
                _CategoryButton( categorie: element, categorieSlc: categorieSlc,),
                const SizedBox( height: 5 ),
                Text( 
                  '${ name[0].toUpperCase() }${ name.substring(1) }',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                 )
    
              ],
            ),
          );
    
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  const _CategoryButton({
    Key? key,
    required this.categorie, required this.categorieSlc,
  }) : super(key: key);

  final CategoryModel categorie;
  final String categorieSlc;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final ArticlesProvider articleprov = Provider.of<ArticlesProvider>(context, listen: false);
        articleprov.selectedCaregory = categorie.category;
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle
        ),
        child: Icon( 
          categorie.icon, 
          color: categorieSlc == categorie.category
            ? Colors.redAccent
            : Colors.black 
        ),
      ),
    );
  }
}