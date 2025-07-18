import 'package:flutter/material.dart';

final _colors = [
  Color(0xffF64136),
  Color(0xffEA1E63),
  Color(0xff9C28AF),
  Color(0xff673BB7),
  Color(0xff3F53B6),
  Color(0xff2196F3),
  Color(0xff00BCD4),
  Color(0xff009688),
  Color(0xff4CAF50),
  Color(0xff8BC34A),
  Color(0xffCDDC39),
  Color(0xffFFC107),
  Color(0xffFF5722),
  Color(0xff795548),
  Color(0xff9E9E9E),
  Color(0xff607D8B),
  Color(0xff000000),
  Color(0xffFFFFFF),
  Color(0xff000000),
];
Future<Color> showColorPicker(BuildContext context, Color currentColor) async {
  Color pickedColor = currentColor;

  await showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    // isScrollControlled: true,
    enableDrag: true,
    builder: (context) {
      return SizedBox(
        height: 250,
        child: Column(
          children: [
            SizedBox(height: 25),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 22),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  childAspectRatio: 2.0,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                ),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      pickedColor = _colors[index];
                      Navigator.pop(context);
                    },
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: _colors[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
                itemCount: _colors.length,
              ),
            ),
          ],
        ),
      );
    },
  );
  return pickedColor;
}
