import 'package:flutter/material.dart';

class OwnerDescription extends StatelessWidget {
  const OwnerDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 315.0),
      height: 180.0,
      padding: const EdgeInsets.fromLTRB(25.0, 20.0, 25.0, 20.0),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/mircea.png'),
              ),
              const SizedBox(width: 15.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Mircea Negrau",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Owner",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "May 26, 2019",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Flexible(
                child: Text(
                  "My job requires moving to another country. I don't have the opportunity to take the cat with me. I am looking for good people who will shelter my Sola.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    wordSpacing: 0.5,
                    fontSize: 16.0,
                    color: Colors.grey[500],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
