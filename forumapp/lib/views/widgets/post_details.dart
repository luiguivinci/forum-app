import 'package:flutter/material.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:forumapp/views/widgets/input_widget.dart';
import 'package:forumapp/views/widgets/post_data.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({super.key, required this.post});

  final PostModel post;

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(widget.post.user!.name!),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              PostData(
                post: widget.post,
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 300,
                child: ListView.builder(
                    itemCount: 10,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return const Text('Commnet');
                    }),
              ),
              InputWidget(
                hintText: 'Write a coment...',
                controller: _commentController,
                obscureText: false,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 10,
                  ),
                ),
                onPressed: () {},
                child: const Text('Comment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
