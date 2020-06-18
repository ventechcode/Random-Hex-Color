import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HexColor extends StatelessWidget {
  final String hexColor;

  HexColor(this.hexColor);

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height - kToolbarHeight;
    var screenWidth = MediaQuery.of(context).size.width - kToolbarHeight;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenHeight * 0.055,
            width: screenWidth * 0.42,
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(2, 3, 0, 0),
            decoration: BoxDecoration(
              border: Border.fromBorderSide(BorderSide(
                color: Colors.black,
                width: 1.5,
              )),
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Center(
              child: SelectableText( // Using a selectable Text for the onTap and copy functions
                hexColor,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: hexColor)); // Copying the Hex Color Code to the Clipboard
                  Scaffold.of(context).showSnackBar( // Showing a Snackbar at the bottom for visual Feedback
                    SnackBar(
                      duration: Duration(milliseconds: 2500),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FlatButton.icon(
                            onPressed: null,
                            icon: Icon(
                              Icons.content_copy,
                              size: 22,
                            ),
                            label: Text(
                              'COPIED TO CLIPBOARD'
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
