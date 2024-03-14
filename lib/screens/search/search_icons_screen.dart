// Project imports:
import '../../gallery_exporter.dart';
import '../icons/icons_rail.dart';
import 'search_suggestion_list.dart';

class SearchIconsScreen extends StatelessWidget {
  const SearchIconsScreen({required this.searchQuery, super.key});

  final String searchQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SearchSuggestionList(query: searchQuery)),
        const IconsRail(),
      ],
    );
  }
}
