import 'package:flutter/material.dart';
import 'package:pet_adoption/configurations.dart';

class FilterBar extends StatelessWidget {
  final bool isFilterOpen;
  final Function editFilters;
  final List selectedIndex;

  const FilterBar(
      {Key? key,
      required this.isFilterOpen,
      required this.editFilters,
      required this.selectedIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isFilterOpen) {
      return SizedBox(
        height: 100,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,

            itemCount: categories.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  editFilters(index);
                },
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(left: 30),
                      decoration: BoxDecoration(
                        color: selectedIndex.contains(index)
                            ? primaryYellow
                            : Colors.white,
                        boxShadow: shadowList,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.asset(
                        categories[index]['iconPath']!,
                        height: 50.0,
                        width: 50.0,
                        color: selectedIndex.contains(index)
                            ? Colors.white
                            : Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 7.0),
                    Row(children: [
                      const SizedBox(width: 20.0),
                      Text(categories[index]['name']!)
                    ]),
                  ],
                ),
              );
            }),
      );
    } else {
      return Container();
    }
  }
}
