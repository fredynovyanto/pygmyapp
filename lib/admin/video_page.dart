import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pygmyapp_menu/admin/add_video.dart';
import 'package:pygmyapp_menu/detailvid.dart';
import 'package:pygmyapp_menu/drawer_widget.dart';
import 'package:pygmyapp_menu/models/video_model.dart';
import 'package:pygmyapp_menu/provider/video_provider.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VideoProvider videoProvider = context.read<VideoProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pygmy Owl Coffee",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot<Video>>(
            stream: videoProvider.streamvideo(),
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
                            ),
                            IconButton(
                              onPressed: () async {
                                if (await confirm(
                                  context,
                                  title: const Text('Confirm'),
                                  content: const Text('Are you sure to delete this video?'),
                                  textOK: const Text('Yes'),
                                  textCancel: const Text('No'),
                                )) {
                                  bool hapus = await videoProvider.deleteVideo(video.videoId);
                                  (!hapus)
                                  ? ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Can't delete video"),
                                    ))
                                  : ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text("Video successfully deleted"),
                                    ));
                                }
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
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
      drawer: const DrawerWidget(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return const AddVideo();
              }));
      }, child: const Icon(Icons.add)),
    );
  }
}
