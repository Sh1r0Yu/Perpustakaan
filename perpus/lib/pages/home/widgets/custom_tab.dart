import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget{
  final int selected;
  final Function callback;
  CustomTab (this.selected, this.callback, {super.key});
  final tabs = ['Buku', 'Artikel'];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(5),
      ),
      width: width,
      height: 56,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) => GestureDetector(
          onTap: () =>callback(index),
          child: Container(
            decoration: BoxDecoration(
              color: selected == index ? const Color.fromARGB(255, 163, 163, 163) : const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            width: ( width - 40) / 2 - 10,
            child: Text(
              tabs[index],           
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        separatorBuilder: (_, index) => const SizedBox(width: 10),
        itemCount: tabs.length),
      );
  }
}