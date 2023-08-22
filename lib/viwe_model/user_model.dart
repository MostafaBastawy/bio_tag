class UserModel {
  List? links;
  List? connections;
  List? contacts;
  String? email, userName, phone,title,img,bio,id,cover;


  UserModel({this.userName,this.id, this.email, this.title,  this.phone,this.bio,this.img,this.links,this.connections,this.cover,this.contacts});

  UserModel.fromJson(map){
    if (map == null) {
      return;
    }
    phone = map ['phone'];
    title = map['title'];
    img = map['photo'];
    bio = map['bio'];
    links = map['links'];
    connections = map['connections'];
    contacts = map['contacts'];
    email = map ['email'];
    cover = map['cover'];
    id = map['id'];
    userName = map ['userName'];


  }

  toJson() {
    return {
      'id' : id,
      'photo':"https://www.clipartkey.com/view/xmmbTT_user-profile-default-image-png-clipart-png-download/",
      'links':[],
      'title': title,
      'connections' : [],
      'contacts': [],
      'phone': phone,
      'bio': bio,
      'email': email,
      'userName': userName,
      'cover' : cover,

    };
  }

}