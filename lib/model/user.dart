class User{//유저라는 객체에 대한 정보를 정의하는 클래스
  String name;//이름
  int age;//나이
  String imageUrl;//이미지 주소

  User(this.name, {this.age, this.imageUrl});//생성자 오버로드
}