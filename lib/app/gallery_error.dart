// Project imports:
import '../gallery_exporter.dart';

class GalleryError extends StatelessWidget {
  ///This widget displays Erro Messages for our App
  const GalleryError({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    //TODO add some styling here,
    return ErrorWidget(errorText);
  }
}
