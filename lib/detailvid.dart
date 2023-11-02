import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'data.dart';
  
  class Detailvid extends StatefulWidget {
    final String videoUrl;
    final String title;
  
    Detailvid({
      required this.videoUrl,
      required this.title,
    });
  
    @override
    _DetailvidState createState() => _DetailvidState();
  }
  
  class _DetailvidState extends State<Detailvid> {
    late YoutubePlayerController _controller;
  
    @override
    void initState() {
      super.initState();
      _controller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl)!,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Video Detail'),
           backgroundColor: Colors.brown,
        elevation: 0.0,
        centerTitle: true,
        ),
        body: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                          widget.title,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'See Other Videos',
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (_, index) {
                      final video = videos[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Detailvid(
                                    videoUrl: video['url']!,
                                    title: video['title']!,
                                  ),
                                ),
                              )
                            },
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Image.network(
                                video['image']!,
                                fit: BoxFit.cover,
                                width: 120,
                              ),
                              title: Text(
                                video['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      );
    }
  }