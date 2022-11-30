import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:kafarat_plus_merchant/views/widgets/common/card_widget.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_right_rounded, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title:
            Text('الطلب رقم : 2130011', style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      elevation: 5,
                      child: Image.asset(
                        "assets/images/tire512.png",
                        fit: BoxFit.fitHeight,
                      ),
                    );
                  },
                  itemCount: 3,
                  outer: true,
                  pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                          activeColor: Color.fromRGBO(255, 202, 16, 1))),
                ),
              ),
              CardWidget(),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {},
                    child: Text('تعديل الطلب'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
