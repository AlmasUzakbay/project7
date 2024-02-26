import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Новости'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNewsCard(
              context,
              'Главные новости',
              'В России запущена новая космическая ракета с секретной нагрузкой на борту.',
            ),
            SizedBox(height: 20),
            _buildNewsCard(
              context,
              'Экономические новости',
              'В этом году рост ВВП ожидается на уровне 3.5%, что является положительным сигналом для экономики страны.',
            ),
            SizedBox(height: 20),
            _buildNewsCard(
              context,
              'Новости спорта',
              'Сборная России по футболу победила на международном турнире и заняла первое место.',
            ),
            SizedBox(height: 20),
            _buildNewsCard(
              context,
              'Новости культуры',
              'В Москве открылась выставка современного искусства с участием мировых художников.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewsCard(BuildContext context, String title, String content) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            LikeButton(
              size: 40,
              circleColor: CircleColor(start: Colors.redAccent, end: Colors.red),
              bubblesColor: BubblesColor(dotPrimaryColor: Colors.redAccent, dotSecondaryColor: Colors.red),
              likeBuilder: (bool isLiked) {
                return Icon(
                  isLiked ? Icons.favorite : Icons.favorite_border,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 40,
                );
              },
              onTap: (isLiked) {
                return Future.value(!isLiked);
              },
            ),
          ],
        ),
      ),
    );
  }
}
