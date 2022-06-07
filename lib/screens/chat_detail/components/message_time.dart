import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/theme_constant.dart';

class MessageTime extends StatelessWidget {
  const MessageTime({
    Key? key,
    required this.isShowDetail,
    required this.isMe,
    required this.time,
  }) : super(key: key);

  final bool isShowDetail;
  final bool isMe;
  final String time;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Container(
        height: isShowDetail ? null : 0.0,
        padding: EdgeInsets.only(
            bottom: kDefaultPadding / 5,
            left: isMe ? 0 : 40,
            right: isMe ? 28 : 0),
        child: Text(
          "${DateFormat('dd').format(DateTime.parse(time))} THG ${DateFormat('MM').format(DateTime.parse(time))} AT ${DateFormat('HH:mm').format(DateTime.parse(time))}",
          style: const TextStyle(fontSize: 10),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
