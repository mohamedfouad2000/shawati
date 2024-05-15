import 'package:flutter/cupertino.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/fav_screen_list.dart';
import 'package:shawati/generated/l10n.dart';

class FavoritesScreenBody extends StatelessWidget {
  const FavoritesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).favorites,
            style: StylesData.font24Google,
          ),
          const SizedBox(
            height: 10,
          ),
          const FavScreenList(),
        ],
      ),
    );
  }
}
