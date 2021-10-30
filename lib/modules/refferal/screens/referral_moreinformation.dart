import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
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
            backgroundColor: Theme.of(context).backgroundColor,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back, size: 24),
            ),
            actions: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.person, size: 20)),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text("Hello Alumnous",
                      style: TextStyle(
                          fontFamily: 'Poppins', height: 1.3, fontSize: 30)),
                ),
                CategoryList(),
                //Assign item here
                // ServiceStaggerGridView(),
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

  Service(this.title, this.subtitle, this.imageUrl, this.height);

  static List<Service> generateServices(){
    return [
    Service("Service 1", "this is service 1", "assets/images/alumni_background.jpg", 240),
    Service("Service 2", "this is service 2", "assets/images/alumni_background.jpg", 200),
    Service("Service 3", "this is service 3", "assets/images/alumni_background.jpg", 120),
    Service("Service 4", "this is service 4", "assets/images/alumni_background.jpg", 200),
    Service("Service 5", "this is service 5", "assets/images/alumni_background.jpg", 240),
    Service("Service 6", "this is service 6", "assets/images/alumni_background.jpg", 140),
    ];

  }

}

//service_item
class ServiceItem extends StatelessWidget {
  final Service service;
  ServiceItem(this.service);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  Alignment.bottomLeft,
      height: service.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            service.imageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child:Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(service.title,
            style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'Poppins'),
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
    );
  }
}

//service_staggergridview
class ServiceStaggerGridView extends StatelessWidget {
  final serviceList = Service.generateServices();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          crossAxisCount: 4,
          itemBuilder: (context, index) => ServiceItem(serviceList[index]),
          staggeredTileBuilder: (_) => StaggeredTile.fit(2))
    );
  }
}




