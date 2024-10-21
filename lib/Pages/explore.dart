import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopContainer(constraints),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildPopularLocations(constraints),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildRecommendedSection(constraints),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildAd(constraints),
                  SizedBox(height: constraints.maxHeight * 0.02),
                  _buildMostViewed(constraints),
                  SizedBox(height: constraints.maxHeight * 0.15),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTopContainer(BoxConstraints constraints) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          20, constraints.maxHeight * 0.03, 20, constraints.maxHeight * 0.015),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 236, 249),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Explore the world! By',
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.06,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.001),
          Text(
            'Travelling',
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.06,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: constraints.maxHeight * 0.014),
          Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Where did you go?',
                    hintStyle: TextStyle(
                      fontFamily: 'BeVietnamPro',
                      fontSize: constraints.maxWidth * 0.035,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Container(
                      padding: EdgeInsets.all(constraints.maxWidth * 0.03),
                      child: Icon(Icons.search),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: constraints.maxWidth * 0.02),
              Container(
                  height: constraints.maxHeight * 0.07,
                  width: constraints.maxWidth * 0.15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Icon(Icons.filter_list))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPopularLocations(BoxConstraints constraints) {
    final locations = [
      {
        'name': 'India',
        'image':
            'https://cdn.britannica.com/01/75501-050-26B6A00F/taj-mahal-agra-india.jpg'
      },
      {
        'name': 'Moscow',
        'image':
            'https://salviatravelsindia.com/wp-content/uploads/2020/09/moscow-Saint-Basil-Cathedral2jpg.jpg'
      },
      {
        'name': 'USA',
        'image':
            'https://img.traveltriangle.com/blog/wp-content/uploads/2020/02/usa_freedom_stature_new_york-1183170.jpg'
      },
      {
        'name': 'Thailand',
        'image':
            'https://www.thailand-tourism.net/wp-content/uploads/2021/11/bangkock.jpg'
      },
      {
        'name': 'Singapore',
        'image':
            'https://static.toiimg.com/thumb/msid-107700466,width-748,height-499,resizemode=4,imgsize-119838/.jpg'
      },
      {
        'name': 'Dubai',
        'image':
            'https://static.independent.co.uk/s3fs-public/thumbnails/image/2018/08/30/14/dubai-main.jpg'
      },
      {
        'name': 'Malaysia',
        'image':
            'https://static2.tripoto.com/media/filter/tst/img/210609/TripDocument/1474116741_destination_for_malaysian_24343.jpg'
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Text(
            'Popular locations',
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.055,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.012),
        Container(
          height: constraints.maxHeight * 0.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: locations.length,
            itemBuilder: (context, index) {
              return _buildLocationCard(locations[index]['name']!,
                  locations[index]['image']!, constraints);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLocationCard(
      String location, String imageUrl, BoxConstraints constraints) {
    return Container(
      width: constraints.maxWidth * 0.34,
      margin: EdgeInsets.only(left: constraints.maxWidth * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl, 
                  height: constraints.maxHeight * 0.235,
                  width: constraints.maxWidth * 0.375,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                   return Image.asset(
                      'assets/placeholder.jpg', 
                      height: constraints.maxHeight * 0.235,
                      width: constraints.maxWidth * 0.375,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: constraints.maxHeight * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.7)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      location,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: constraints.maxWidth * 0.035,
                        fontFamily: 'BeVietnamPro',
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
        ],
      ),
    );
  }

  Widget _buildRecommendedSection(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Text(
            'Recommended',
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.055,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.01),
        Padding(
          padding: EdgeInsets.only(left: constraints.maxWidth * 0.04),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recommendedItems.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(right: constraints.maxWidth * 0.04),
                  child: _buildRecommendedCard(
                    recommendedItems[index]['image']!,
                    recommendedItems[index]['price']!,
                    recommendedItems[index]['name']!,
                    recommendedItems[index]['description']!,
                    recommendedItems[index]['rating']!,
                    constraints,
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendedCard(
    String imageUrl,
    String price,
    String name,
    String description,
    String rating,
    BoxConstraints constraints,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl, 
                height: constraints.maxHeight * 0.25,
                width: constraints.maxWidth * 0.700,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                 
                  return Image.asset(
                    'assets/placeholder.jpg', 
                    height: constraints.maxHeight * 0.25,
                    width: constraints.maxWidth * 0.700,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            Positioned(
              top: constraints.maxHeight * 0.01,
              right: constraints.maxWidth * 0.02,
              child: Container(
                padding: EdgeInsets.all(constraints.maxWidth * 0.015),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
                ),
                child: Icon(Icons.favorite,
                    color: Colors.grey, size: constraints.maxWidth * 0.045),
              ),
            ),
          ],
        ),
        SizedBox(height: constraints.maxHeight * 0.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '$price ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraints.maxWidth * 0.045,
                      fontFamily: 'BeVietnamPro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text: '/ Night',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: constraints.maxWidth * 0.0325,
                      fontFamily: 'BeVietnamPro',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: constraints.maxWidth * 0.0075),
                Icon(Icons.bolt,
                    color: Colors.yellow, size: constraints.maxHeight * 0.025),
                SizedBox(width: constraints.maxWidth * 0.32),
                Icon(Icons.star,
                    color: Colors.red, size: constraints.maxWidth * 0.045),
                Text(rating,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: constraints.maxWidth * 0.035)),
              ],
            ),
          ],
        ),
        SizedBox(height: constraints.maxHeight * 0.005),
        Text(
          name,
          style: TextStyle(
            color: Colors.black,
            fontSize: constraints.maxWidth * 0.035,
            fontFamily: 'BeVietnamPro',
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          description,
          style: TextStyle(
            color: const Color(0xFF686868),
            fontSize: constraints.maxWidth * 0.035,
            fontFamily: 'BeVietnamPro',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildAd(BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.0425),
      height: constraints.maxHeight * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Group 12211@3x.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(constraints.maxWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hosting Fee for',
              style: TextStyle(
                color: Colors.white,
                fontSize: constraints.maxWidth * 0.05,
                fontFamily: 'BeVietnamPro',
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'as low as 1%',
              style: TextStyle(
                color: Colors.white,
                fontSize: constraints.maxWidth * 0.05,
                fontFamily: 'BeVietnamPro',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.02),
            Container(
              height: constraints.maxHeight * 0.05,
              width: constraints.maxWidth * 0.35,
              decoration: BoxDecoration(
                color: const Color(0xFFFF5A5F),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Become a Host',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: constraints.maxWidth * 0.0325,
                    fontFamily: 'BeVietnamPro',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMostViewed(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05),
          child: Text(
            'Most Viewed',
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.055,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SizedBox(height: constraints.maxHeight * 0.01),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.0425),
          child: Column(
            children: List.generate(mostViewedItems.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: constraints.maxHeight * 0.02),
                child: _buildMostviewedCard(
                  mostViewedItems[index]['image']!,
                  mostViewedItems[index]['price']!,
                  mostViewedItems[index]['name']!,
                  mostViewedItems[index]['description']!,
                  mostViewedItems[index]['rating']!,
                  constraints,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildMostviewedCard(
    String imageUrl,
    String price,
    String name,
    String description,
    String rating,
    BoxConstraints constraints,
  ) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,  
                  height: constraints.maxHeight * 0.22,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                   
                    return Image.asset(
                      'assets/placeholder.jpg', 
                      height: constraints.maxHeight * 0.22,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                top: constraints.maxHeight * 0.01,
                right: constraints.maxWidth * 0.02,
                child: Container(
                  padding: EdgeInsets.all(constraints.maxWidth * 0.015),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(color: Colors.black26, blurRadius: 4),
                    ],
                  ),
                  child: Icon(Icons.favorite,
                      color: Colors.grey, size: constraints.maxWidth * 0.045),
                ),
              ),
            ],
          ),
          SizedBox(height: constraints.maxHeight * 0.01),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: price,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constraints.maxWidth * 0.055,
                            fontFamily: 'BeVietnamPro',
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        TextSpan(
                          text: ' / Night',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: constraints.maxWidth * 0.045,
                            fontFamily: 'BeVietnamPro',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.bolt,
                      color: Colors.yellow,
                      size: constraints.maxHeight * 0.025),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.star,
                      color: const Color(0xFFFF5A5F),
                      size: constraints.maxWidth * 0.05),
                  Text(rating,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: constraints.maxWidth * 0.04)),
                ],
              ),
            ],
          ),
          SizedBox(height: constraints.maxHeight * 0.005),
          Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: constraints.maxWidth * 0.045,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            description,
            style: TextStyle(
              color: const Color(0xFF686868),
              fontSize: constraints.maxWidth * 0.045,
              fontFamily: 'BeVietnamPro',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Sample data for recommended items
  final List<Map<String, String>> recommendedItems = [
    {
      'image':
          'https://daahy6akrtcj2.cloudfront.net/hotelsincoimbatore.net/logos/coco_lagoon_resort.jpg',
      'price': '\$120',
      'name': 'Carinthia Lake see Breakfast',
      'description': 'Private room / 4 beds',
      'rating': '4',
    },
    {
      'image':
          'https://media-cdn.tripadvisor.com/media/photo-s/03/df/bd/0a/radhika-beach-resort.jpg',
      'price': '\$400',
      'name': 'Beachside Villa',
      'description': 'Private room / 2 beds',
      'rating': '5',
    },
    {
      'image':
          'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_534,q_40,w_800/hotelier-images/e0/7b/40eead99cceb3d62e3e997ee05ca67681dfed1f9340ffd3603f30ce0641d.jpeg',
      'price': '\$180',
      'name': 'Mountain Retreat',
      'description': 'Shared room / 6 beds',
      'rating': '4',
    },
    {
      'image':
          'https://imgcld.yatra.com/ytimages/image/upload/t_seo_Hotel_w_930_h_550_c_fill_g_auto_q_40_f_jpg/v7867570046/Hotel/00191146/Swimming_Pool_nYkVj1.jpeg',
      'price': '\$220',
      'name': 'City Center Inn',
      'description': 'Private room / 1 bed',
      'rating': '3',
    },
  ];

  // Sample data for most viewed hotels
  final List<Map<String, String>> mostViewedItems = [
    {
      'image':
          'https://imgcld.yatra.com/ytimages/image/upload/t_seo_Hotel_w_930_h_550_c_fill_g_auto_q_40_f_jpg/v7867570046/Hotel/00191146/Swimming_Pool_nYkVj1.jpeg',
      'price': '\$240',
      'name': 'Carinthia Lake',
      'description': 'Private room / 4 beds',
      'rating': '4',
    },
    {
      'image':
          'https://imgcy.trivago.com/c_fill,d_dummy.jpeg,e_sharpen:60,f_auto,h_534,q_40,w_800/hotelier-images/e0/7b/40eead99cceb3d62e3e997ee05ca67681dfed1f9340ffd3603f30ce0641d.jpeg',
      'price': '\$180',
      'name': 'Mountain Lodge',
      'description': 'Shared room / 6 beds',
      'rating': '4',
    },
    {
      'image':
          'https://media-cdn.tripadvisor.com/media/photo-s/03/df/bd/0a/radhika-beach-resort.jpg',
      'price': '\$300',
      'name': 'Ocean View Suite',
      'description': 'Private room / 2 beds',
      'rating': '5',
    },
    {
      'image':
          'https://daahy6akrtcj2.cloudfront.net/hotelsincoimbatore.net/logos/coco_lagoon_resort.jpg',
      'price': '\$220',
      'name': 'City Center Hotel',
      'description': 'Private room / 1 bed',
      'rating': '3',
    },
  ];
}
