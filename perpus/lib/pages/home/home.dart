import 'package:flutter/material.dart';
import 'package:perpus/constants/colors.dart';
import 'package:perpus/pages/home/widgets/custom_tab.dart';
import 'package:perpus/pages/home/widgets/book_staggered_gridview.dart';

class Homepage extends StatefulWidget{
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var tabIndex = 0;
  var bottomindex = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          CustomTab(tabIndex,(int index){
            setState(() {
              tabIndex = index;
            });
            pageController.jumpToPage(index);
           }),
           Expanded(child: BookStaggeredGridView(
            tabIndex,
            pageController,
            (int index) => setState(() {
              tabIndex = index;
            }),
           ))
        ],
      ),
      bottomNavigationBar: _buildBottomNaviagtionBar(),
    );
  }
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        onPressed: () {}, 
        icon: const Icon(
          Icons.menu_rounded,
        color: Colors.black,
        ),
      ),
      title: const Text(
        'All Books',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){}, 
          icon: const Icon(
            Icons.search_outlined,
            color: Colors.black,
          )
        )
      ],
    );
  }
  
Widget _buildBottomNaviagtionBar() {
    final bottoms = [
      Icons.home_outlined,
      Icons.analytics_outlined,
      Icons.bookmark_border_outlined,
      Icons.person_outlined,
    ];
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () => setState(() {
            bottomindex = index;
          }),
          child: Container(
            width: (width - 40) / 4,
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: bottomindex == index ?
            const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  width: 3,
                  color: Colors.blue,
                )))
                : null,
                child: Icon(
                  bottoms[index],
                  size: 30,
                  color: bottomindex == index ? kFont : Colors.grey,
                ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: bottoms.length,
      ),
    );
  }
}