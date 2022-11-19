import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class CardNew extends StatelessWidget {
  const CardNew({
    Key? key,
    required this.article, required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( horizontal: 20 ),
      child: Column(
        children: [

          _TopBarCard( article: article, index: index ),
          _TitleCard(article: article),
          _ImgCard(article: article),

          _BodyCard(article: article),


          const SizedBox( height: 20 ),
          const Divider(),
          const SizedBox( height: 20 ),

        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: 10 ),
      child: Text( 
              (article.description == null)
                ?  ''
                : article.description ?? '',  
            )
    );
  }
}

class _TopBarCard extends StatelessWidget {

  const _TopBarCard({
    Key? key,
    required this.article, required this.index,
  }) : super(key: key);

  final Article article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 5 ),
      child: Row(
        children: [

          const Icon( Icons.public, size: 16, ),
          const SizedBox( width: 10 ),
          Text( article.source.name )
        ],
      ),
    );
  }
}


class _TitleCard extends StatelessWidget {

  const _TitleCard({
    Key? key,
    required this.article
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric( vertical: 5 ),
      child: Text( 
        article.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ), 
      ),
    );
  }
}

class _ImgCard extends StatelessWidget {
  const _ImgCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular( 20 ),
      child: Container(
        // padding: EdgeInsets.symmetric( horizontal: 20 ),
        width: double.infinity,
        height: 250,
        
        child: article.urlToImage != null
          ? FadeInImage(
              placeholder: const AssetImage( 'assets/giphy.gif' ), 
              image: NetworkImage( article.urlToImage ?? 'https://via.placeholder.com/400x400' ),
              fit: BoxFit.cover,
            )
          : const Image( image: AssetImage('assets/no-image.png'), fit: BoxFit.cover )
          ,
    
      ),
    );
  }
}