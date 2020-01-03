import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String _mediaType;
  final String _mediaId;

  Detail(this._mediaType, this._mediaId);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('Detail -> mediaType: $_mediaType | mediaId: $_mediaId'),
    );
  }
}
