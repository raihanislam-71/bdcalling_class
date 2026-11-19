import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Hello,Raihan', style: TextStyle(fontSize: 16)),
              SizedBox(height: 4),
              Text(
                'where do you went to go?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        SizedBox(
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.asset('assets/images/professional_white_shirt.png'),
          ),
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Row(
        children: [
          Icon(Icons.search, color: Colors.black54),
          Text('Search places', style: TextStyle(color: Colors.black45)),
          Spacer(),
          Icon(Icons.search, color: Colors.black54),
        ],
      ),
    );
  }
}
