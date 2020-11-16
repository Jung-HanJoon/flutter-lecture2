import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_apps_https/model/post.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<Post> post1 = [
    //리스트 타일
    Post('삼성 오디세이 G5 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G7 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G9 49인치 팝니다.', '방금 전', '내용')
  ];

  List<Post> post2 = [
    Post('삼성 오디세이 G5 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G7 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G9 49인치 팝니다.', '방금 전', '내용')
  ];

  List<Post> post3 = [
    Post('삼성 오디세이 G5 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G7 32인치 팝니다.', '방금 전', '내용'),
    Post('삼성 오디세이 G9 49인치 팝니다.', '방금 전', '내용')
  ];

  bool isSwitched = true; //스위치 버튼의 상태를 저장

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(//앱바에 대한 내용
        title: Row(//텍스트와 아이콘 버튼이 있으니 로우를 삽입
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(//Cafe와 아이콘 사이를 넓히기 위해 사용
                child: Text(
              'Cafe',
              style:
                  TextStyle(fontWeight: FontWeight.bold),
            )),
            Icon(//+아이콘
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            Icon(Icons.search, color: Colors.black, size: 30)//돋보기아이콘
          ],
        ),
        backgroundColor: Colors.white,//기본 테마엔 하얀색이 안되서 배경색을 넣어줌
      ),
      body: ListView(
        children: [
          Image.network(
            'https://naverpa-phinf.pstatic.net/MjAyMDExMDNfMTc5/MDAxNjA0Mzg1Njk1NTkx.-gcta--JH9oD082007m7sPJ_PfDIgMG7K-MIQ1XO-_kg.UEpEF9sC3pJdbCWNmGuMQWs4LMgccRkKeFXFqsc4a5gg.PNG/1103_%EC%88%99%EB%B0%95%EB%8C%80%EC%A0%84_%EB%84%A4%EC%9D%B4%EB%B2%84GFA_750X160_%EB%A7%A4%EC%9E%A5%ED%98%95A_v1.png',
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(//빈공간 채우기
                    child: Text(
                  '내 카페',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                )),
                Text('최신글'),
                Switch(//토글 버튼 위젯
                  value: isSwitched,//위젯의 상태를 저장할 변수 ex) on or off
                  onChanged: (value) {//버튼을 눌렀을때 동작하는 내용
                    setState(() {//위젯의 상태를 바꾸면서 화면을 다시 그리게끔 함
                      isSwitched = value;//토글을 눌러서 바뀐 상태를 변수에 저장함.
                      print(isSwitched);
                    });
                  },
                ),
                Text('더보기'),
              ],
            ),
          ),
          _buildTile(
              'https://www.joongna.com/_nuxt/img/190410_signature_basic.2e10f76.png',
              '중고나라',
              10458,
              post1),
          _buildTile(
              'https://www.joongna.com/_nuxt/img/190410_signature_basic.2e10f76.png',
              '코드천국',
              50458,
              post2),
          _buildTile(
              'https://www.joongna.com/_nuxt/img/190410_signature_basic.2e10f76.png',
              '천국의계단',
              18,
              post3),
          _buildTile(
              'https://www.joongna.com/_nuxt/img/190410_signature_basic.2e10f76.png',
              '바람의나라',
              3512,
              post3),
          _buildTile(
              'https://www.joongna.com/_nuxt/img/190410_signature_basic.2e10f76.png',
              '레드벨벳',
              78963,
              post3),
        ],
      ),
    );
  }

  Widget _buildTile(String url, String cafe, int newpost, List<Post> post) {
    return ListTile(
      title: Column(
        children: [
          Row(
            children: [
              Image.network(
                url,//이미지 주소
                width: 60,//이미지 크기
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cafe,//카페 이름
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '새글 $newpost개',//새로 올라온 게시글 수
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            ],
          ),
          Column(
            children: post.map((post) => _buildRow(post)).toList(),//게시글 정보
          )
        ],
      ),
    );
  }

  Widget _buildRow(post) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Expanded(
              child: Text(
            post.title,
            style: TextStyle(fontSize: 14),
          )),
          Text(post.postdate,
              style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
