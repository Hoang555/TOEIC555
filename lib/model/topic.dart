class Topic {
  int idChude;
  String title;
  String image;

  Topic(
      {this.idChude,
        this.title,
        this.image
      });

//  factory Topic.fromJson(Map<String, dynamic> res) {
//    return new Topic(
//      title: res['emty'] as String,
//      image: res['/Volcabulary/airline.png'] as String
//    );
//  }
}

//  static List<Topic> init() {
//    List<Topic> data = [
//      Topic(
//          idChude: 1,
//          title: "600 từ vựng TOEIC",
//          image: "assets/abc.png"
//      ),
//      Topic(
//          idChude: 2,
//          title: "Ngữ pháp",
//          image: "assets/G_icon.png"
//      ),
//      Topic(
//          idChude: 3,
//          title: "Luyện đề",
//          image: "assets/test.png"
//      ),
//      Topic(
//          idChude: 4,
//          title: "Mẹo thi",
//          image: "assets/smart.png"
//      ),
//    ];
//
//    return data;
//  }
//}
