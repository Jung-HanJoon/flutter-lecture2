import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_apps_https/model/user.dart';

import 'user_photo_view_page.dart';

class ThirdPage extends StatelessWidget {
  List<User> userlist = [//User 객체를 담는 리스트를 선언
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'), //User에 인자를 넣어 생성자를 호출 후 리스트에 담음
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4'),
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'),
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4'),
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'),
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4'),
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'),
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4'),
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'),
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4'),
    User('아이린',
        age: 30,
        imageUrl:
            'https://i.pinimg.com/originals/f4/43/bd/f443bd4d47b6005f61fb8ab4271b204e.jpg'),
    User('슬기',
        age: 27,
        imageUrl:
            'https://img1.daumcdn.net/thumb/R720x0.q80/?scode=mtistory2&fname=http%3A%2F%2Fcfile30.uf.tistory.com%2Fimage%2F996682385AD0B8C806C2ED'),
    User('웬디',
        age: 27,
        imageUrl:
            'https://lh3.googleusercontent.com/proxy/xFQlyRDWQUiuu-knACANo0hysqos1xM1p40xghXAgTlPj6LY9ljRbIyrpDlMxW1JMzzz6MS_R3HxZN19RJX60diYCYECkSPKrx1VBpozYesZYGngzJZGMBT4')
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(//이 클래스가 호출되면 리스트뷰를 리턴함
      children: userlist.map((user) {
        //리스트뷰의 아이템으로 userlist에 있는 객체들을 하나씩 꺼내어 user에 담아주고
        return _buildListTile(context, user);
        //리스트타일을 만들어주는 메서드에 컨텍스트와 객체를 넘겨준다. 이걸 반복함.
      }).toList(),
      //이렇게 된 결과를 다시 리스트로 변환하여 위젯 List를 가지는 속성 children에 대입해줌.
    );
  }

  Widget _buildListTile(context, user) {//위젯을 반환하며 컨텍스트와 유저 객체를 인자로 받아 사용하는 함수
    return ListTile(//리스트 타일을 반환한다.
        title: Row(
          children: [
            ClipRRect(//위젯의 모양을 바꿔주는 위젯인듯함
                borderRadius: BorderRadius.circular(100),//ClipRRect에서 각 모서리를 원형으로 100만큼 깎아냄
                child: Hero(//화면 이동간 이미지의 위치 변환에 대한 에니메이션을 부여해주는 역할을 함.
                    tag: user,//각 위젯이 어디로 가는지에 대한 내용을 태그해줌. user는 객체의 저장 주소를 뜻하므로 유일하다.
                    child: InkWell(//onTap 속성이 있는 위젯이며, 클릭시 물방울이 퍼져나가는듯한 효과를 준다. ListTile보다 하위에 있는 위젯을 클릭하기 위해 사용하였음.
                      onTap: () {//위젯을 클릭했을때.
                        Navigator.push(//화면 전환을 위한 네비게이터의 메서드 푸쉬를 호출해서 안드로이드 스타일로 새로운 화면을 만들고, UserPhotoViewPage에 uesr객체를 전달하며 호출함.
                          context,
                          MaterialPageRoute(builder: (context) => UserPhotoViewPage(user)),
                        );
                      },
                      child: Image.network(//이미지를 온라인상의 주소를 이용해 불러오는 기능.
                        user.imageUrl,//유저 객체에 저장된 이미지의 Url
                        width: 100,//가로 길이
                        height: 100,//세로 길이
                        fit: BoxFit.cover,//꽉차게
                      ),
                    ))),
            Expanded(// 양쪽 정렬을 위해 Row의 중앙에 위치한 텍스트 영역을 최대화함
              child: Padding(//안쪽 여백 부여
                padding: const EdgeInsets.all(16.0),//상하좌우 16만큼 여백
                child: Column(//컬럼(수직)
                  crossAxisAlignment: CrossAxisAlignment.start,//컬럼의 반대방향(수평) 왼쪽 끝에 정렬
                  children: [
                    Text(
                      user.name,//유저 객체의 속성 name을 출력할 텍스트에 표시
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),//글자크기20, 굵게
                    ),
                    Text('${user.age}'),//user객체의 속성을 텍스트 타입에 쓰기 위해 '${user.age'의 형식으로 감싸줌
                  ],
                ),
              ),
            ),
            Icon(Icons.call)
          ],
        ));
  }
}
