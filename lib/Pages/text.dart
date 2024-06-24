// Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.blue, // Background color
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//                 margin: EdgeInsets.all(20), // Margin around the container
//                 padding: EdgeInsets.all(10), // Padding inside the container

//                 child: TextField(
//                   controller: myController,
//                 ),
//               )

//               Container(
//                 width: 200,
//                 height: 200,
//                 decoration: BoxDecoration(
//                   color: Colors.blue, // Background color
//                   borderRadius: BorderRadius.circular(10), // Rounded corners
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: Offset(0, 3), // changes position of shadow
//                     ),
//                   ],
//                 ),
//               ),

import 'package:flutter/material.dart';

/// Flutter code sample for [showModalBottomSheet].

void main() => runApp(const ModalBottomSheetApp());

class ModalBottomSheetApp extends StatelessWidget {
  const ModalBottomSheetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Modal Bottom Sheet Sample')),
        body: const ModalBottomSheetExample(),
      ),
    );
  }
}

enum AnimationStyles { defaultStyle, custom, none }

const List<(AnimationStyles, String)> animationStyleSegments =
    <(AnimationStyles, String)>[
  (AnimationStyles.defaultStyle, 'Default'),
  (AnimationStyles.custom, 'Custom'),
  (AnimationStyles.none, 'None'),
];

class ModalBottomSheetExample extends StatefulWidget {
  const ModalBottomSheetExample({super.key});

  @override
  State<ModalBottomSheetExample> createState() =>
      _ModalBottomSheetExampleState();
}

class _ModalBottomSheetExampleState extends State<ModalBottomSheetExample> {
  Set<AnimationStyles> _animationStyleSelection = <AnimationStyles>{
    AnimationStyles.defaultStyle
  };
  AnimationStyle? _animationStyle;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SegmentedButton<AnimationStyles>(
            selected: _animationStyleSelection,
            onSelectionChanged: (Set<AnimationStyles> styles) {
              setState(() {
                _animationStyle = switch (styles.first) {
                  AnimationStyles.defaultStyle => null,
                  AnimationStyles.custom => AnimationStyle(
                      duration: const Duration(seconds: 3),
                      reverseDuration: const Duration(seconds: 1),
                    ),
                  AnimationStyles.none => AnimationStyle.noAnimation,
                };
                _animationStyleSelection = styles;
              });
            },
            segments: animationStyleSegments
                .map<ButtonSegment<AnimationStyles>>(
                    ((AnimationStyles, String) shirt) {
              return ButtonSegment<AnimationStyles>(
                  value: shirt.$1, label: Text(shirt.$2));
            }).toList(),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('showModalBottomSheet'),
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                sheetAnimationStyle: _animationStyle,
                builder: (BuildContext context) {
                  return SizedBox.expand(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const Text('Modal bottom sheet'),
                          ElevatedButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
