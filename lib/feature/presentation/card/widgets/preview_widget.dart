import 'package:flutter/material.dart';
import 'package:nesine/feature/domain/entities/preview_entity.dart';
import 'package:nesine/feature/presentation/home/widgets/preview_cache_image_widget.dart';

class PreViewWidget extends StatelessWidget {
  const PreViewWidget({Key? key, required this.previewEntity}) : super(key: key);

  final PreviewEntity previewEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24282F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF24282F),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 5,),

             Padding(
              padding: const EdgeInsets.all(10.0),
              child:  Text(
                previewEntity.title,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PreviewCacheImage(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.3,
                imageUrl: previewEntity.image,
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                previewEntity.diskription,
                style: const TextStyle(color: Colors.black87,fontSize: 24,fontWeight: FontWeight.w900),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      )
    );
  }
}
