class Album{
  int userId;
  int id;
  String title;



  Album({this.userId, this.id, this.title});

  Album.fromJson(Map<String, dynamic> json) {//유틸성 문법 static과 동일한 역할을 함
      userId= json['userId'];
      id= json['id'];
      title= json['title'];
  }

  Map<String, dynamic> toJson(){
    var map = <String, dynamic>{};
    map['userId']=userId;
    map['id']=id;
    map['title']=title;
  }

  @override
  String toString() {
    return 'Album{userId: $userId, id: $id, title: $title}';
  }
}