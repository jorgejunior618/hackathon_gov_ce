import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:transparencia_gov_ce/styles/material_styles.dart';

// import 'package:transparencia_gov_ce/screens/categories.dart';
// import 'package:transparencia_gov_ce/screens/best-deals.dart';
// import 'package:transparencia_gov_ce/screens/search.dart';
// import 'package:transparencia_gov_ce/screens/cart.dart';
// import 'package:transparencia_gov_ce/screens/chat.dart';

import 'package:transparencia_gov_ce/widgets/input.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final Widget img;
  final String title;
  final String categoryOne;
  final String categoryTwo;
  final bool searchBar;
  final bool backButton;
  final bool menuButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final Function onBackTap;
  final bool isOnSearch;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool searchAutofocus;
  final bool noShadow;
  final Color bgColor;

  Navbar({
    this.title = "Home",
    this.categoryOne = "",
    this.categoryTwo = "",
    this.tags,
    this.img,
    this.transparent = false,
    this.rightOptions = false,
    this.getCurrentPage,
    this.searchController,
    this.isOnSearch = false,
    this.searchOnChanged,
    this.searchAutofocus = false,
    this.backButton = false,
    this.menuButton = false,
    this.noShadow = false,
    this.bgColor = MaterialColors.primary,
    this.searchBar = false,
    this.onBackTap: defaultBackTap,
  });

  final double _prefferedHeight = 180.0;

  static void defaultBackTap(BuildContext context) {
    Navigator.pushReplacementNamed(
      context,
      '/home',
    );
  }

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag;

  ItemScrollController _scrollController = ItemScrollController();

  void initState() {
    if (widget.tags != null && widget.tags.length != 0) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool categories =
        widget.categoryOne.isNotEmpty && widget.categoryTwo.isNotEmpty;
    final bool tagsExist =
        widget.tags == null ? false : (widget.tags.length == 0 ? false : true);
    // final altura = MediaQuery.of(context).padding.top;

    return Container(
        // padding: const EdgeInsets.only(top: 4.0),
        /*height: widget.searchBar
            ? (!categories
                ? (tagsExist ? 191.0 : 158.0)
                : (tagsExist ? 242.0 : 190.0))
            : (!categories
                ? (tagsExist
                    ? 112.0
                    : altura > 40
                        ? 105.0
                        : 82.0)
                : (tagsExist ? 180.0 : 130.0)),*/
        decoration: BoxDecoration(
            color: !widget.transparent ? widget.bgColor : Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: !widget.transparent && !widget.noShadow
                      ? Colors.black.withOpacity(0.6)
                      : Colors.transparent,
                  spreadRadius: -10,
                  blurRadius: 12,
                  offset: Offset(0, 5))
            ]),
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        (widget.backButton || widget.menuButton)
                            ? /* Padding(
                                padding: const EdgeInsets.only(top: 0),
                                child:  */
                            IconButton(
                                enableFeedback: true,
                                alignment: Alignment.bottomCenter,
                                icon: Icon(
                                  !widget.backButton
                                      ? Icons.menu
                                      : Icons.arrow_back,
                                  color: !widget.transparent
                                      ? (widget.bgColor == Colors.white
                                          ? Colors.black
                                          : Colors.white)
                                      : Colors.white,
                                  size: 24.0,
                                  semanticLabel: widget.backButton
                                      ? 'Retornar'
                                      : 'Abrir Menu',
                                ),
                                onPressed: () {
                                  if (!widget.backButton)
                                    Scaffold.of(context).openDrawer();
                                  else
                                    widget.onBackTap(context);
                                },
                                // ),
                              )
                            : Container(width: 0),
                        Container(
                          padding: const EdgeInsets.only(
                            left: 8.0,
                            top: widget.menuButton || widget.backButton
                                ? 8.0
                                : widget.img == null
                                    ? 16.0
                                    : 0.0,
                          ),
                          child: widget.img == null
                              ? Text(
                                  widget.title,
                                  style: TextStyle(
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: widget.img,
                                ),
                        ),
                      ],
                    ),
                    if (widget.rightOptions)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Chat()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.chat_bubble_outline,
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : Colors.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                          GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Cart()));
                            },
                            child: IconButton(
                                icon: Icon(Icons.add_shopping_cart,
                                    color: !widget.transparent
                                        ? (widget.bgColor == Colors.white
                                            ? Colors.black
                                            : Colors.white)
                                        : Colors.white,
                                    size: 22.0),
                                onPressed: null),
                          ),
                        ],
                      )
                  ],
                ),
                if (widget.searchBar)
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 4, left: 15, right: 15),
                    child: Input(
                        placeholder: "What are you looking for?",
                        controller: widget.searchController,
                        onChanged: widget.searchOnChanged,
                        autofocus: widget.searchAutofocus,
                        outlineBorder: true,
                        enabledBorderColor: Colors.black.withOpacity(0.2),
                        focusedBorderColor: MaterialColors.muted,
                        suffixIcon:
                            Icon(Icons.zoom_in, color: MaterialColors.muted),
                        onTap: () {
                          // if (!widget.isOnSearch)
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Search()));
                        }),
                  ),
                SizedBox(
                  height: tagsExist ? 0 : 10,
                ),
                if (categories)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => Categories()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.border_all,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryOne,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      ),
                      SizedBox(width: 30),
                      Container(
                        color: MaterialColors.muted,
                        height: 25,
                        width: 0.3,
                      ),
                      SizedBox(width: 30),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => BestDeals()));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.camera_enhance,
                                color: Colors.black87, size: 22.0),
                            SizedBox(width: 10),
                            Text(widget.categoryTwo,
                                style: TextStyle(
                                    color: Colors.black87, fontSize: 16.0)),
                          ],
                        ),
                      )
                    ],
                  ),
                if (tagsExist)
                  Container(
                    height: 40,
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.tags.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            if (activeTag != widget.tags[index]) {
                              setState(() => activeTag = widget.tags[index]);
                              _scrollController.scrollTo(
                                  index:
                                      index == widget.tags.length - 1 ? 1 : 0,
                                  duration: Duration(milliseconds: 420),
                                  curve: Curves.easeIn);
                              if (widget.getCurrentPage != null)
                                widget.getCurrentPage(activeTag);
                            }
                          },
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: index == 0 ? 46 : 8, right: 8),
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 2.0,
                                          color: activeTag == widget.tags[index]
                                              ? MaterialColors.primary
                                              : Colors.transparent))),
                              child: Center(
                                child: Text(widget.tags[index],
                                    style: TextStyle(
                                        color: activeTag == widget.tags[index]
                                            ? MaterialColors.primary
                                            : MaterialColors.placeholder,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.0)),
                              )),
                        );
                      },
                    ),
                  )
              ],
            ),
          ),
        ));
  }
}
