import 'package:flutter/material.dart';

enum StrokeConnerType { rounded, sharp }

/// child,
/// strokeWidth = 6,
/// strokeHeight = 100,
/// backgroundColor = Colors.black12,
/// thumbColor = Colors.white,
/// alignment = Alignment.topRight,
/// padding = EdgeInsets.zero,
/// strokeConnerType = StrokeConnerType.rounded,
/// showScrollbar = true,
/// scrollbarMargin = const EdgeInsets.all(8.0),

class BumbleScrollbar extends StatefulWidget {
  const BumbleScrollbar({
    Key? key,
    required this.child,
    this.strokeWidth = 6,
    this.strokeHeight = 100,
    this.backgroundColor = Colors.black12,
    this.thumbColor = Colors.white,
    this.alignment = Alignment.topRight,
    this.padding = EdgeInsets.zero,
    this.strokeConnerType = StrokeConnerType.rounded,
    this.showScrollbar = true,
    this.scrollbarMargin = const EdgeInsets.all(8.0),
  }) : super(key: key);

  final Widget child;
  final double strokeWidth;
  final double strokeHeight;
  final Color thumbColor;
  final Color backgroundColor;
  final AlignmentGeometry alignment;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry scrollbarMargin;
  final StrokeConnerType strokeConnerType;
  final bool showScrollbar;

  @override
  _BumbleScrollbarState createState() => _BumbleScrollbarState();
}

class _BumbleScrollbarState extends State<BumbleScrollbar> {
  late ScrollController _controller;
  late double _thumbHeight;
  late double _strokeHeight;
  late bool _showScrollbar;

  double _thumbPosition = 0;

  @override
  void initState() {
    super.initState();
    _showScrollbar = widget.showScrollbar;
    _thumbHeight = widget.strokeHeight * 0.2;
    _strokeHeight = widget.strokeHeight;
    _controller = ScrollController()..addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_controller.hasClients) {
      final double maxScrollSize = _controller.position.maxScrollExtent;
      final double currentPosition = _controller.position.pixels;
      final scrollPosition =
          ((_strokeHeight - _thumbHeight) / (maxScrollSize / currentPosition));

      setState(() {
        _thumbPosition = scrollPosition.clamp(0, _strokeHeight - _thumbHeight);
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_scrollListener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _child,
        if (_showScrollbar) _scrollbar,
      ],
    );
  }

  Widget get _child {
    return SingleChildScrollView(
      padding: widget.padding,
      controller: _controller,
      child: widget.child,
    );
  }

  Widget get _scrollbar {
    final width = widget.strokeWidth;

    final connerRadius = widget.strokeConnerType == StrokeConnerType.rounded
        ? BorderRadius.circular(width)
        : BorderRadius.zero;

    return Align(
      alignment: widget.alignment,
      child: Padding(
        padding: widget.scrollbarMargin,
        child: Stack(
          children: [
            Container(
              width: width,
              height: _strokeHeight,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: connerRadius,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 100),
              top: _thumbPosition,
              child: Container(
                width: width,
                height: _thumbHeight,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  borderRadius: connerRadius,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
