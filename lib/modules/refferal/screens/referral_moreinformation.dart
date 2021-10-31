import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:uni_alumni/modules/refferal/screens/referral_moreinformation_detail.dart';
import 'package:uni_alumni/shared/constants/assets.dart';
import 'package:uni_alumni/shared/constants/colors.dart';

class MoreInformation extends StatelessWidget {
  final _referralController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          backgroundColor: Colors.green,
          primaryColor: Colors.yellow,
          accentColor: Colors.red,
        ),
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back, size: 24, color: Colors.black),
            ),
            actions: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  child: Image.asset(
                    AssetConstants.logo,
                    width: 60,
                  ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("FPT ALUMNI",
                      style: TextStyle(
                          fontFamily: 'Poppins',
                          height: 1.3, fontSize: 30,
                          color: ColorConstants.primaryAppColor,
                          letterSpacing: 2,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                // CategoryList(),
                SizedBox(height: 10),
                //Assign item here
                ServiceStaggerGridView(),
              ],
            ),
          ),
        ));
  }

}

//category
class CategoryList extends StatefulWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  final categoryList = ['Instruction', 'Service', 'More'];
  int currentSelected = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentSelected = index;
                    });
                  },
                  child: Text(
                    categoryList[index],
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: currentSelected == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: currentSelected == index
                            ? Theme.of(context).primaryColor
                            : Colors.red),
                  ),
                ),
            separatorBuilder: (_, index) => SizedBox(width: 20),
            itemCount: categoryList.length));
  }
}

//service
class Service{
  String title;
  String subtitle;
  String imageUrl;
  double height;
  String content;

  Service(this.title, this.subtitle, this.imageUrl, this.height, this.content);

  static List<Service> generateServices(){
    return [
    Service("Referral", "For students around us ", "assets/images/referral.jpg", 240, "'Let\'s more student become a member of our university"),
    Service("Alumni", "Graduate students ", "assets/images/alumni_club.jpg", 200, "The Alumni community make a connection between F students generations."),
    Service("Recruitment", "", "assets/images/recruitment.jpg", 120, "The recruitment service  help alumni have more opportunities to have a job."),
    Service("News", "Hot news of Fpt Community", "assets/images/News.jpg", 200, "FPT News - Alumni can read news of FPT Corporation, Fpt Education and more."),
    Service("Group", "Alumni Community", "assets/images/group.png", 240, "Alumni  is free to join any group in Alumni Community."),
    Service("Event", "Free to join, enjoy the moment", "assets/images/event.jpg", 140, "Alumni can join events with F students generations, FPT Community..."),
    ];

  }

}



//service_item
class ServiceItem extends StatelessWidget {
  final Service service;
  ServiceItem(this.service);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => DetailPage(service))
        );
      },
      child: Stack(
        children:[
          Container(
          alignment:  Alignment.bottomLeft,
          height: service.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(
                service.imageUrl,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
          Container(
            height: service.height,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withAlpha(0),
                  Colors.black12,
                  Colors.black45,
                  Colors.black87,
                ]
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(service.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(service.subtitle,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins'),
                  ),

                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}

//service_staggergridview
class ServiceStaggerGridView extends StatelessWidget {
  final serviceList = Service.generateServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 4,
          itemCount: serviceList.length,
          itemBuilder: (context, index) => ServiceItem(serviceList[index]),
          staggeredTileBuilder: (_) => StaggeredTile.fit(2))
    );
  }
}




