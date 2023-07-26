import 'package:flutter/material.dart';

class CustomNoteItem extends StatelessWidget {
  const CustomNoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(24),
            title: const Text(
              'Flutter Tips',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
            subtitle: const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'build your career with me',
                style: TextStyle(color: Colors.black45, fontSize: 16),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(
                Icons.delete,
                color: Colors.black,
                size: 40,
              ),
              onPressed: () {},
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 24, right: 24),
            child: Text(
              'May 21, 2022 ,',
              style: TextStyle(color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
