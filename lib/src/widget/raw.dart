import 'package:flutter/material.dart';

typedef ButtonBuilder = Widget Function(
  BuildContext context,
  VoidCallback onTap,
);

typedef MenuBuilder = Widget Function(
  BuildContext context,
  double? width,
);

//* PRECISE LOCATION OF THE DROPDOWN
enum MenuPosition {
  topStart,
  topEnd,
  topCenter,
  bottomStart,
  bottomEnd,
  bottomCenter,
}

class RawFlexDropDown extends StatefulWidget {
  const RawFlexDropDown({
    super.key,
    required this.controller,
    required this.buttonBuilder,
    required this.menuBuilder,
    this.menuPosition = MenuPosition.bottomStart,
  });

  final OverlayPortalController controller;

  final ButtonBuilder buttonBuilder;
  final MenuBuilder menuBuilder;
  final MenuPosition menuPosition;

  @override
  State<RawFlexDropDown> createState() => _RawFlexDropDownState();
}

class _RawFlexDropDownState extends State<RawFlexDropDown> {
  final _link = LayerLink();

  /// width of the button after the widget rendered
  double? _buttonWidth;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: widget.controller,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: switch (widget.menuPosition) {
              MenuPosition.bottomEnd => Alignment.bottomRight,
              MenuPosition.bottomStart => Alignment.bottomLeft,
              MenuPosition.bottomCenter => Alignment.bottomCenter,
              MenuPosition.topStart => Alignment.topLeft,
              MenuPosition.topEnd => Alignment.topRight,
              MenuPosition.topCenter => Alignment.topCenter,
            },
            followerAnchor: switch (widget.menuPosition) {
              MenuPosition.bottomEnd => Alignment.topRight,
              MenuPosition.bottomStart => Alignment.topLeft,
              MenuPosition.bottomCenter => Alignment.topCenter,
              MenuPosition.topStart => Alignment.bottomLeft,
              MenuPosition.topEnd => Alignment.bottomRight,
              MenuPosition.topCenter => Alignment.bottomCenter,
            },
            showWhenUnlinked: false,
            child: Align(
              alignment: switch (widget.menuPosition) {
                MenuPosition.bottomEnd => AlignmentDirectional.topEnd,
                MenuPosition.bottomStart => AlignmentDirectional.topStart,
                MenuPosition.bottomCenter => AlignmentDirectional.topCenter,
                MenuPosition.topStart => AlignmentDirectional.bottomStart,
                MenuPosition.topEnd => AlignmentDirectional.bottomEnd,
                MenuPosition.topCenter => AlignmentDirectional.bottomCenter,
              },
              child: widget.menuBuilder(context, _buttonWidth),
            ),
          );
        },
        child: widget.buttonBuilder(context, onTap),
      ),
    );
  }

  void onTap() {
    _buttonWidth = context.size?.width;

    widget.controller.toggle();
  }
}
