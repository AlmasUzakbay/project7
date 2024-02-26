import 'package:flutter/material.dart';
import '../model/user.dart';
import 'news_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../pages/constants.dart';

class UserInfoPage extends StatelessWidget {
  final User userInfo;

  const UserInfoPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context); // Инициализация flutter_screenutil

    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        centerTitle: true,
      ),
      body: _buildUserInfo(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Constants.primaryColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.green),
            label: 'Пользователь',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.green),
            label: 'Настройки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.new_releases, color: Colors.green),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.green),
            label: 'Меню',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Constants.primaryColor,
        onTap: (int index) {
          if (index == 0) {
            _showUserInfo(context);
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => NewsPage()),
            );
          } else {
            // Другие действия при выборе других разделов
          }
        },
      ),
    );
  }

  Widget _buildUserInfo() {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text(
              userInfo.name,
              style: TextStyle(fontWeight: FontWeight.w500).merge(Constants.textStyle), // Применяем стиль
            ),
            subtitle: Text(userInfo.story, style: Constants.textStyle), // Применяем стиль
            leading: Icon(
              Icons.person,
              color: Constants.textColor,
            ),
            trailing: Text(userInfo.country, style: Constants.textStyle), // Применяем стиль
          ),
          ListTile(
            title: Text(
              userInfo.phone,
              style: Constants.textStyle, // Применяем стиль
            ),
            leading: Icon(
              Icons.phone,
              color: Constants.textColor,
            ),
          ),
          ListTile(
            title: Text(
              userInfo.email.isEmpty ? 'Not specified' : userInfo.email,
              style: Constants.textStyle, // Применяем стиль
            ),
            leading: Icon(
              Icons.mail,
              color: Constants.textColor,
            ),
          ),
        ],
      ),
    );
  }

  void _showUserInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('User Info'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Name: ${userInfo.name}', style: Constants.textStyle), // Применяем стиль
              Text('Phone: ${userInfo.phone}', style: Constants.textStyle), // Применяем стиль
              Text('Email: ${userInfo.email}', style: Constants.textStyle), // Применяем стиль
              Text('Country: ${userInfo.country}', style: Constants.textStyle), // Применяем стиль
              Text('Story: ${userInfo.story}', style: Constants.textStyle), // Применяем стиль
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close', style: Constants.textStyle), // Применяем стиль
            ),
          ],
        );
      },
    );
  }
}
