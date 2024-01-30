import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Luigui Vinci',
            style: GoogleFonts.poppins(),
          ),
          Text(
            'luigui@gmail.com',
            style: GoogleFonts.poppins(
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum Lorem ipsus dolorum ',
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
