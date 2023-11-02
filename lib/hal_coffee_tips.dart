import 'package:flutter/material.dart';

import 'data_coffee_tips.dart';
import 'detail_coffee_tips.dart';
  
  void main() {
    runApp(MaterialApp(
      title: 'Video Video App',
      home: HalTips(),
    ));
  }

  class HalTips extends StatelessWidget {
    const HalTips({Key? key}) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: videos.length,
            itemBuilder: (_, index) {
              final video = videos[index];
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(video['image']!,
                        width: double.infinity, height: 160, fit: BoxFit.cover),
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
                              video['title']!,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          new IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailTips(
                                      videoUrl: video['url']!,
                                      title: video['title']!,
                                      ),
                                ),
                              );
                            },
                             icon: const Icon(
                              Icons.open_in_new),
                          )
                        ],
                      ),
                    ),
                    const Divider(),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              );
            },
          ),
        ),
      );
    }
  }