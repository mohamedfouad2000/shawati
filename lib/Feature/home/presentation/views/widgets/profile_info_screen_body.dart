import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/Feature/home/presentation/views/widgets/edit_user_form.dart';
import 'package:shawati/generated/l10n.dart';

class ProfileInfoScreenBody extends StatefulWidget {
  const ProfileInfoScreenBody({super.key});

  @override
  State<ProfileInfoScreenBody> createState() => _ProfileInfoScreenBodyState();
}

class _ProfileInfoScreenBodyState extends State<ProfileInfoScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).ProfileInfo,
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 15,
            ),
            // const EditImageWidget(),
            // const SizedBox(
            //   height: 15,
            // ),
            const EditUserForm()
          ],
        ),
      ),
    );
  }
}
