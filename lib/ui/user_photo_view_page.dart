import 'package:flutter/cupertino.dart';
import 'package:flutter_apps_https/model/user.dart';

class UserPhotoViewPage extends StatelessWidget {
  User user;//이전 페이지로부터 받은 객체를 저장해줄 변수

  UserPhotoViewPage(User user){//생성자 오버로드
    this.user = user;//받은 객체를 선언해둔 변수에 담기
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Hero(
        tag: user,// 이전 화면에서 어떤 위젯을 이동시킬지 태그를 이용해 짝지음
          child: Image.network(user.imageUrl)),
    );
  }
}
