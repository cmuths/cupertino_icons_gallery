// Project imports:
import 'package:flutter/cupertino.dart';

import '../../../app_exporter.dart';
import '../icon_providers.dart';
import 'details_appbar.dart';
import 'icon_code_snippet.dart';

///[IconDetails] class
class IconDetails extends ConsumerWidget {
  ///[IconDetails] constructor
  const IconDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // selectedIcon
    final selectedGalleryIcon = ref.watch(selectedGalleryIconProvider);

    const packageSnippet = "import 'package:flutter/cupertino.dart';";

    final largeCodeSnippet = '''
Icon(
  CupertinoIcons.${selectedGalleryIcon.name},
),
''';

    // check if we are on mobile
    final responsiveness = ref.watch(responsivenessProvider(context));

    final isMobile = responsiveness.isMobileScreen;

    final smallCodeSnippet = selectedGalleryIcon.name;

    // iconDataSnippet
    final iconDataSnippet = 'CupertinoIcons.${selectedGalleryIcon.name}';

    return ClipRRect(
      borderRadius: isMobile ? borderRadius0 : borderRadius8,
      child: Scaffold(
        backgroundColor: appColor,
        appBar: detailsAppbar(),
        body: Padding(
          padding: padding8,
          child: ExpandedScrollingColumn(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: detailsColor.withOpacity(.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    selectedGalleryIcon.icon,
                    color: detailsTextColor,
                    size: 128,
                  ),
                ),
              ),
              // this is a container that will display a code snippet for the icon with an option to copy it
              // to the clipboard
              const Spacing(of: spacing16),
              const IconCodeSnippet(
                codeSnippet: packageSnippet,
                title: 'Import the Package',
              ),

              const Spacing(of: spacing16),
              IconCodeSnippet(
                codeSnippet: largeCodeSnippet,
                title: 'Use with Icon Widget',
              ),

              const Spacing(of: spacing16),
              IconCodeSnippet(codeSnippet: iconDataSnippet, title: 'Icon Data'),

              const Spacing(of: spacing16),
              IconCodeSnippet(
                codeSnippet: smallCodeSnippet,
                title: 'Flutter ID',
              ),

              const Spacing(of: spacing16),
            ],
          ),
        ),
      ),
    );
  }
}
