import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/data/model/terms_and_privacy_model/data.dart';
import 'package:shawati/Feature/home/data/repo/home_repo_imp.dart';
import 'package:shawati/Feature/home/presentation/views/manager/terms%20And%20Privacy%20Cubit/terms_and_privacy_cubit.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/list_title_menu.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/peson_widget.dart';
import 'package:shawati/generated/l10n.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16, top: 16, bottom: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).Menu,
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 15,
            ),
            const PersonWidget(),
            const SizedBox(
              height: 15,
            ),
            BlocProvider(
              create: (context) =>
                  TermsAndPrivacyCubit(HomeRepoImpl())..getTermsAndPrivacy(),
              child: BlocConsumer<TermsAndPrivacyCubit, TermsAndPrivacyState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is GetTermsAndPrivacySucc) {
                    return ListTitleMenu(
                      data: state.model.data ?? TermAndPrivacyData(),
                    );
                  } else if (state is GetTermsAndPrivacyError) {
                    return Center(
                      child: Text(state.msg),
                    );
                  } else {
                    return const Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
