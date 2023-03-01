import 'package:flutter/material.dart';
import 'package:nesine/feature/data/model/preview_model.dart';
import 'package:nesine/feature/domain/entities/preview_entity.dart';

import 'preview_cache_image_widget.dart';

class PreviewListWidget extends StatelessWidget {
  PreviewListWidget({
    Key? key,
    required this.previewList,
    required this.toCard,
  }) : super(key: key);


  List<PreviewEntity> previewList;
  Function toCard;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24282F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF24282F),
        title: const Text(
          'NEW SPORT',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: previewList.length,
            itemBuilder: (context, index){
              return GestureDetector(
                onTap: () => toCard(previewList[index]),
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3C3E44),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      PreviewCacheImage(
                        width: 166,
                        height: 166,
                        imageUrl: previewList[index].image,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              previewList[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // Text(
                            //   previewList[index].diskription,
                            //   textAlign: TextAlign.justify,
                            //     overflow: TextOverflow.ellipsis,
                            //   style: const TextStyle(color: Color(0xFF9E9E9E),
                            //   ),
                            // ),
                            const SizedBox(
                              height: 4,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
