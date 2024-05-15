import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shawati/Core/utils/styles.dart';
import 'package:shawati/generated/l10n.dart';

class TermsScreenBody extends StatelessWidget {
  const TermsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).termsconditions,
              style: StylesData.font24Google,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              S.of(context).TandC,
//               '''
// This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application.
// Where the designer has to put temporary, virtual and unreal texts on the design to show the client the full form, and here comes the role of the default text, which saves the designer the trouble of searching for an alternative text that has nothing to do with the topic that the design is talking about, so it appears in an inappropriate way or with incorrect content that distracts the mind Client .
// This text can be installed on any design without a problem, the design will appear organized, coordinated, and clear because it is still an alternative and temporary text and not a real text.
// Also, this text will be modified later by the customer after receiving his site and starting to add his real contents through it or through his data entry or through his participation in the content management services that a tqnia company gladly provides to its valued customers.
//         ''',
              style: StylesData.font12.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              S.of(context).TandC2,

//               '''
// This text is extracted from a tqnia company its a text generator and is an example of an unreal virtual text that can be replaced in the same space. This text was generated from a tqnia text generator, where you can generate such text or many other texts in addition to increasing the number of characters it generates application.
//         ''',
              style: StylesData.font12.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
