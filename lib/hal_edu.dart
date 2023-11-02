import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/models/video_model.dart';
import 'package:pygmyapp_menu/provider/video_provider.dart';

import 'detailvid.dart';

class HalEdu extends StatelessWidget {
  const HalEdu(this.category, {Key? key}) : super(key: key);
  final String category;

  @override
  Widget build(BuildContext context) {
    VideoProvider videoProvider = context.read<VideoProvider>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot<Video>>(
            stream: videoProvider.getVideo(category),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.hasData) {
                return const Center(
                  child: Text("No data"),
                );
              }
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Error! Can't get data"),
                );
              }
              List<Video> allVideo = [];

              for (var element in snapshot.data!.docs) {
                allVideo.add(element.data());
              }

              if (allVideo.isEmpty) {
                return const Center(
                  child: Text("No data"),
                );
              }
              return ListView.builder(
                itemCount: allVideo.length,
                itemBuilder: (_, index) {
                  final video = allVideo[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(video.image,
                          width: double.infinity,
                          height: 160,
                          fit: BoxFit.cover),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 45,
                              height: 45,
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_640.png',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                video.title,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detailvid(
                                      videoUrl: video.url,
                                      title: video.title,
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.open_in_new),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
