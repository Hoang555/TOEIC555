class Selection {
  int id;
  String title;
  String description;
  String image;

  Selection(
      {this.id,
        this.title,
        this.description,
        this.image
        });

  static List<Selection> init() {
    List<Selection> data = [
      Selection(
          id: 1,
          title: "600 từ vựng TOEIC",
          description:
          "600 từ là con số tối thiểu bạn cần phải chinh phục trước khi bước vào kì thi.",
          image: "assets/abc.png"
          ),
      Selection(
          id: 2,
          title: "Ngữ pháp",
          description:
          "Nền tàng quan trọng cần nắm vững.",
          image: "assets/G_icon.png"
          ),
      Selection(
          id: 3,
          title: "Luyện đề",
          description:
          "Nơi để bạn luyện tập trước khi bước vào kì thi thật.",
          image: "assets/test.png"
          ),
      Selection(
          id: 4,
          title: "Mẹo thi",
          description:
          "Những mẹo vặt giúp bạn hoàn thành bài thi nhanh và chính xác.",
          image: "assets/smart.png"
          ),
    ];

    return data;
  }
}
