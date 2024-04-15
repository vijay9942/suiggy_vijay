import 'package:flutter/material.dart';
import 'package:suiggy_vijay/form.dart';

class HotelSalemrr extends StatefulWidget {
  const HotelSalemrr({Key? key}) : super(key: key);

  @override
  State<HotelSalemrr> createState() => _HotelSalemrrState();
}

class _HotelSalemrrState extends State<HotelSalemrr> {
  final List<String> imageUrls = [
    'images/download (7).jpg',
    'images/images.jpg',
    'images/images (1).jpg',
    'images/images (2).jpg',
  ];

  final List<String> imageTexts = [
    '4.1',
    '4.5',
    '3.9',
    '4.3',
  ];
  final List<String> views = ['1.3K', '111', '2.4K', '1.6K'];
  final List<String> names = [
    'Hyd.Mutton Biryani',
    'Mutton Biryani',
    'Egg Biryani',
    'Prawn Biryani'
  ];
  final List<String> clothes = [
    'Hyd.Mutton Biryani',
    'Mutton Biryani',
    'Egg Biryani',
    'Prawn Biryani'
  ];
  final List<String> amount = [
    '\u{20B9} 467',
    '\u{20B9} 540',
    '\u{20B9} 750',
    '\u{20B9} 699'
  ];
  final List<String> discount = [
    '\u{20B9} 900',
    '\u{20B9} 1200',
    '\u{20B9} 1450',
    '\u{20B9} 1425',
  ];
  final List<String> offer = [
    '(70% OFF)',
    '(60% OFF)',
    '(75% OFF)',
    '(65% OFF)',
  ];
  final List<String> price = [
    'Best Price \u{20B9}319',
    'Best Price \u{20B9}279',
    'Best Price \u{20B9}215',
    'Best Price \u{20B9}320',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: Icon(Icons.arrow_back_sharp),
        title: Text('SALEM RR'),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.add_box_outlined),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.favorite_border),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.orangeAccent,
              child: ListTile(
                title: Center(
                  child: Text(
                    'Welcome To Hotel',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Center(
                  child: Text(
                    'SALEM RR',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 35.0,
                  mainAxisExtent: 355,
                ),
                itemCount: imageUrls.length,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SShotel()));
                        },
                        child: Container(
                          height: 250,
                          width: 250,
                          child: Image.asset(
                            imageUrls[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 210,
                        left: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(
                                  4.0), // Adjust padding as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Add border radius if desired
                                color: Colors
                                    .blue, // Add background color if desired
                              ),
                              child: IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                                color:
                                    Colors.white, // Adjust icon color if needed
                              ),
                            ),
                            // SizedBox(width: 30.0),
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    12.0), // Set the radius here
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  'ccc',
                                ),
                              ),
                            ),
                            // Add some space between the icon buttons
                            Container(
                              padding: EdgeInsets.all(
                                  4.0), // Adjust padding as needed
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Add border radius if desired
                                color: Colors
                                    .red, // Add background color if desired
                              ),
                              child: IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  // Add your onPressed logic here
                                },
                                color:
                                    Colors.white, // Adjust icon color if needed
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 265,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    names[index],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      letterSpacing: 0.8,
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          4), // Adjust the space between the two texts
                                  Text(
                                    clothes[
                                        index], // Add your additional text here
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Text(
                                        amount[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        discount[index],
                                        style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey),
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        offer[index],
                                        style: TextStyle(
                                            color: Colors.deepOrange,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            price[index],
                                            style: TextStyle(
                                                color:
                                                    Colors.greenAccent.shade700,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                          ),
                                          Text('with coupon')
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              Icon(Icons.favorite_border),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
