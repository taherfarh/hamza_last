import 'package:client_app/core/common/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';


class ReadMoreWidget extends StatefulWidget {
  final String htmlText;
  final int maxLines;

  const ReadMoreWidget({
    super.key,
    this.htmlText = "",
    this.maxLines = 1,
  });

  @override
  _ReadMoreWidgetState createState() => _ReadMoreWidgetState();
}

class _ReadMoreWidgetState extends State<ReadMoreWidget> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Html(
          shrinkWrap: true,
          data: widget.htmlText,
          style: {
            'body': Style(
              maxLines: _isExpanded ? null : widget.maxLines,
              textOverflow:
              _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            ),
          },
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded
                ? "أقل"
                : "أكثر",
            style: TextStyle(
              color: AppColors.orange,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
