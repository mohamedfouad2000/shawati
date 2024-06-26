import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ProductImageScreen extends StatefulWidget {
  final List<String>? imageList;
  const ProductImageScreen(
      {super.key, required this.imageList, required this.index});
  final int index;

  @override
  ProductImageScreenState createState() => ProductImageScreenState();
}

class ProductImageScreenState extends State<ProductImageScreen> {
  int? pageIndex;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    pageIndex = widget.index;
    _pageController = PageController(initialPage: pageIndex ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(
          child: Stack(
            children: [
              PhotoViewGallery.builder(
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    imageProvider: NetworkImage('${widget.imageList?[index]}'),
                    initialScale: PhotoViewComputedScale.contained,
                    heroAttributes:
                        PhotoViewHeroAttributes(tag: index.toString()),
                  );
                },
                backgroundDecoration:
                    BoxDecoration(color: Theme.of(context).highlightColor),
                itemCount: widget.imageList!.length,
                loadingBuilder: (context, event) => Center(
                    child: SizedBox(
                        width: 20.0,
                        height: 20.0,
                        child: CircularProgressIndicator(
                          value: event == null
                              ? 0
                              : event.cumulativeBytesLoaded /
                                  event.expectedTotalBytes!,
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ))),
                pageController: _pageController,
                onPageChanged: (int index) {
                  setState(() {
                    pageIndex = index;
                  });
                },
              ),
              pageIndex != 0
                  ? Positioned(
                      left: 5,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.grey, shape: BoxShape.circle),
                        child: InkWell(
                          onTap: () {
                            if (pageIndex! > 0) {
                              _pageController!.animateToPage(pageIndex! - 1,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child:
                              const Icon(Icons.chevron_left_outlined, size: 40),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              pageIndex != widget.imageList!.length - 1
                  ? Positioned(
                      right: 5,
                      top: 0,
                      bottom: 0,
                      child: Container(
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                          child: InkWell(
                              onTap: () {
                                if (pageIndex! < widget.imageList!.length) {
                                  _pageController!.animateToPage(pageIndex! + 1,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.easeInOut);
                                }
                              },
                              child: const Icon(Icons.chevron_right_outlined,
                                  size: 40))),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ]),
    );
  }
}
