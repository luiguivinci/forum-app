import 'dart:convert';

import 'package:forumapp/constants/constants.dart';
import 'package:forumapp/models/post_model.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class PostController extends GetxController {
  Rx<List<PostModel>> posts = Rx<List<PostModel>>([]);
  final isLoading = false.obs;
  final box = GetStorage();

  @override
  void onInit() {
    getAllPosts();
    super.onInit();
  }

  Future getAllPosts() async {
    try {
      isLoading.value = true;
      var response = await http.get(
        Uri.parse('${url}feeds'),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${box.read('token')}',
        },
      );
      if (response.statusCode == 200) {
        isLoading.value = false;
        for (var item in json.decode(response.body)['feeds']) {
          posts.value.add(PostModel.fromJson(item));
        }
      } else {
        isLoading.value = false;
        print(jsonDecode(response.body));
      }
    } catch (e) {
      isLoading.value = false;
      print(e.toString());
    }
  }
}
