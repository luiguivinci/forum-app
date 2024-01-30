import 'package:flutter/material.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/widgets/post_details.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostData extends StatelessWidget {
  const PostData({
    super.key,
    required this.post,
  });

  final PostModel post;

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
            post.user!.name!,
            style: GoogleFonts.poppins(),
          ),
          Text(
            post.user!.email!,
            style: GoogleFonts.poppins(
              fontSize: 10,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            post.content!,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.thumb_up),
              ),
              IconButton(
                onPressed: () {
                  Get.to(
                    () => PostDetails(
                      post: post,
                    ),
                  );
                },
                icon: const Icon(Icons.message),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
