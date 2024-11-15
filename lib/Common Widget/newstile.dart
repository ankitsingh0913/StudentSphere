import 'package:flutter/material.dart';

class NewsTileCell extends StatelessWidget {
  final String title;
  final String detail;
  final VoidCallback onPressed;
  const NewsTileCell({
    super.key,
    required this.title,
    required this.detail,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 6,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes the position of the shadow
            ),
          ],
        ),
        margin: const EdgeInsets.only(left: 20,right: 20,top: 20),
        child: Row(
          children: [
            CircleAvatar(
              child: Icon(
                size: 35,
                Icons.newspaper
              ),
            ),
            const SizedBox(width: 5),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      detail, // Add your subtitle text here
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600]
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),

      ),
    );
  }
}
