import 'package:flutter/cupertino.dart';
import 'package:shawati/Core/utils/assets_data.dart';
import 'package:shawati/Core/utils/colors.dart';

class EditImageWidget extends StatelessWidget {
  const EditImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 130,
            width: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  image: AssetImage(AssetsData.testimage), fit: BoxFit.cover),
            ),
          ),
          Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                color: ConstColor.kMainColor,
                borderRadius: BorderRadius.circular(12),
                // border: Border.all(color: Colors.white, width: .8),
              ),
              child: const Image(
                image: AssetImage(AssetsData.upload),
                fit: BoxFit.cover,
              )),
        ],
      ),
    );
  }
}
