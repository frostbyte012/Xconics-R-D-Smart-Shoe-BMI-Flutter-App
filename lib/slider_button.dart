import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';

class HorizontalSliderButtonWidget extends StatefulWidget {

  HorizontalSliderButtonWidget({

    required this.result

});

  final String result;

  @override
  State<HorizontalSliderButtonWidget> createState() => _HorizontalSliderButtonWidgetState();
}

class _HorizontalSliderButtonWidgetState extends State<HorizontalSliderButtonWidget> {


  @override
  Widget build(BuildContext context) {
    return HorizontalSlidableButton(
      width: MediaQuery.of(context).size.width / 3,
      buttonWidth: 60.0,
      color: Theme.of(context).accentColor.withOpacity(0.5),
      buttonColor: Theme.of(context).primaryColor,
      dismissible: false,
      label: Center(child: Text('HEIGHT')),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('CM'),
            Text('FT'),
          ],
        ),
      ),
      onChanged: (position) {
        setState(() {
          if (position == SlidableButtonPosition.end) {
             widget.result = 'ft';
          } else {
             widget.result = 'cm';
          }
        });
      },
    );
  }
}

class VerticalSliderButton extends StatefulWidget {
  const VerticalSliderButton({Key? key}) : super(key: key);

  @override
  State<VerticalSliderButton> createState() => _VerticalSliderButtonState();
}

class _VerticalSliderButtonState extends State<VerticalSliderButton> {
  @override
  Widget build(BuildContext context) {
    return VerticalSlidableButton(
      height: MediaQuery.of(context).size.height / 3,
      buttonHeight: 60.0,
      color: Theme.of(context).accentColor.withOpacity(0.5),
      buttonColor: Theme.of(context).primaryColor,
      dismissible: false,
      label: Center(child: Text('Slide Me')),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Top'),
            Text('Bottom'),
          ],
        ),
      ),
      onChanged: (position) {
        setState(() {
          if (position == SlidableButtonPosition.end) {
            widget.result = 'Button is on the bottom';
          } else {
            widget.result = 'Button is on the top';
          }
        });
      },
    );
  }
}

