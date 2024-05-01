import 'package:flutter/material.dart';

class CategoryText extends StatelessWidget {
  final List<String> _categories = ['food', 'Tea', 'Shirt', 'Jeans'];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CATEGORIES',
          style: TextStyle(fontSize: 19),
        ),
        SizedBox(
          height: 40,
          child: Row(
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ActionChip(
                      disabledColor: Colors.yellow.shade900,
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 15),
                      label: Text(_categories[index]),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_forward_ios_outlined),
              )
            ],
          ),
        )
      ],
    );
  }
}
