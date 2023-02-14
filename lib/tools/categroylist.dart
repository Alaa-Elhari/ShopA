import 'package:flutter/material.dart';

class categorylist extends StatefulWidget {
  const categorylist({super.key});

  @override
  State<categorylist> createState() => _categorylistState();
}

class _categorylistState extends State<categorylist> {
  final categorylist = [
    'All',
    'Food',
    'Vegan',
    'Drinks',
    'Beauti',
    'lolo',
    'lkjkdoj'
  ];
  int cur = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) => GestureDetector(
              onTap: (() {
                setState(() {
                  cur = index;
                });
              }),
              child: Text(
                categorylist[index],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight:
                        cur == index ? FontWeight.bold : FontWeight.normal,
                    color: cur == index
                        ? Theme.of(context).primaryColor
                        : Colors.lightGreen),
              ),
            )),
        separatorBuilder: ((_, index) => const SizedBox(
              width: 10,
            )),
        itemCount: categorylist.length,
      ),
    );
  }
}
