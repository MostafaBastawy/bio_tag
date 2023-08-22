class ContactModel {
  List? links;
  String? email, userName, phone,title,img,bio,id,cover;

  bool? isFav;


  ContactModel({this.userName,this.id, this.email, this.title,  this.phone,this.bio,this.img,this.links,this.cover,this.isFav});

  ContactModel.fromJson(map){
    if (map == null) {
      return;
    }
    bio = map['bio'];
    email = map ['email'];
    cover = map['cover'];
    id = map['id'];
    userName = map ['userName'];
    phone = map ['phone'];
    title = map['title'];
    img = map['photo'];
    links = map['links'];
    isFav = map['isFav'];

  }

  toJson() {
    return {
      'email': email,
      'userName': userName,
      'cover' : cover,
      'id' : id,
      'photo':"https://www.clipartkey.com/view/xmmbTT_user-profile-default-image-png-clipart-png-download/",
      'links':[],
      'title': title,
      'phone': phone,
      'bio': bio,
      'isFav':isFav,
    };
  }

}