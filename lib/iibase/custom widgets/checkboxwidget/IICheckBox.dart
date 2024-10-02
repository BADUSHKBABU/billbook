import 'package:billbook/iibase/custom%20widgets/checkboxwidget/checkboxprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//controller has the value , when called that controller we ddeclared has th value ie. controller.value;  


class IICheckBox extends StatefulWidget {
  final ValueNotifier<bool> controller;
  final String caption;

  IICheckBox({
    Key? key,
    required this.controller,
    this.caption = "",
  }) : super(key: key);

  @override
  State<IICheckBox> createState() => _IICheckBoxState();
}

class _IICheckBoxState extends State<IICheckBox> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
 int valuetobesend=0;
  @override
  Widget build(BuildContext context) {
    final _provider=Provider.of<checkboxprovider>(context,listen: false);
    return ValueListenableBuilder<bool>(
      valueListenable: widget.controller,
      builder: (context, value, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Checkbox(
                value: value,
                onChanged: (bool? b) {
                  widget.controller.value = b!;
                  if(widget.controller.value==true)
                  {
                    valuetobesend=1;
                    _provider.ValuetoBeSend(valuetobesend);
                  }
                  else{
                    valuetobesend=0;
                    _provider.ValuetoBeSend(valuetobesend);
                  }
                  
                },
              ),
              if (widget.caption.isNotEmpty) Text(widget.caption), // Check for non-empty caption
            ],
          ),
        );
      },
    );
  }
}
