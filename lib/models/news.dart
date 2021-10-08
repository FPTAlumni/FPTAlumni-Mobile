
class News{
 String author;
 String? desc;
 String title;
 String imageUrl;
 String? url;
 String? content;
 String? publishAt;

 News({required this.author,
 required this.desc,
 required this.title,
 required this.imageUrl,
 required this.url,
 required this.content,
 required this.publishAt});

 factory News.fromJson(Map<String,dynamic> json) => News(
  author: json['author'],
  title: json['title'],
  imageUrl: json['imageUrl'],
  desc: json['desc'],
  content: json['content'],
  publishAt: json['publishAt'],
  url: json['json'],
 );
}