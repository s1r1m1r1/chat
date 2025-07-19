import 'package:chat_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_chat_flutter/serverpod_chat_flutter.dart';
import 'package:custom_clippers/custom_clippers.dart';

/// Shows the ChatView and ChatInput for a chat controller.
class ChatPage extends StatelessWidget {
  const ChatPage({
    required this.controller,
    super.key,
  });

  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mq = MediaQuery.of(context);

    return Column(
      children: [
        Expanded(
          child: ChatView(
              controller: controller,
              tileBuilder: (context, current, previous) {
                final isUser =
                    current.sender == sessionManager.signedInUser?.id;
                final sameSender = current.sender == previous?.sender;

                return _MessageBox(
                  sameSender: sameSender,
                  avatarUrl: current.senderInfo?.imageUrl,
                  isUser: isUser,
                  timeFormatted:
                      "${current.time.hour} : ${current.time.minute.toString().padLeft(2, '0')}",
                  message: current.message,
                  senderName: current.senderInfo?.userName ?? '',
                  onTap: () {
                    debugPrint('onTap');
                  },
                );
              }),
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          padding: EdgeInsets.only(bottom: mq.padding.bottom),
          child: ChatInput(controller: controller),
        ),
      ],
    );
  }
}

class _MessageBox extends StatefulWidget {
  const _MessageBox({
    required this.sameSender,
    required this.isUser,
    this.avatarUrl,
    required this.senderName,
    required this.message,
    required this.timeFormatted,
    required this.onTap,
  });
  final bool sameSender;
  final String senderName;
  final String? avatarUrl;
  final String timeFormatted;
  final bool isUser;
  final String message;
  final void Function() onTap;

  static const tabStr = '\t\t\t';

  @override
  State<_MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<_MessageBox>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final messageStyle = TextStyle(color: Colors.black, fontSize: 14);
    final leading = Container(
      width: 30,
      height: 30,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red,
        image: widget.avatarUrl != null
            ? DecorationImage(image: NetworkImage(widget.avatarUrl!))
            : null,
      ),
    );
    return LayoutBuilder(builder: (context, constraint) {
      // Row(children: rowKids)

      final rowKids = [
        if (!widget.sameSender) leading else const SizedBox(width: 34),
        Flexible(
          child: ClipPath(
            clipper: !widget.sameSender
                ? UpperNipMessageClipper(
                    widget.isUser ? MessageType.send : MessageType.receive,
                    bubbleRadius: 8,
                    sizeOfNip: 4,
                    sizeRatio: 4)
                : ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)))),
            child: GestureDetector(
              onTap: () {
                widget.onTap();
              },
              child: ColoredBox(
                color: Colors.red,
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 4, 4, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!widget.sameSender)
                            RichText(
                              text: TextSpan(
                                  text: _MessageBox.tabStr,
                                  style: messageStyle,
                                  children: [
                                    TextSpan(
                                        text: widget.senderName,
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.purple[800],
                                            fontWeight: FontWeight.w900))
                                  ]),
                            ),
                          Text(
                            "${_MessageBox.tabStr}${widget.message}",
                            style: messageStyle,
                          ),
                          // reserved space for bottom
                          SizedBox(height: 32, width: 100),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      height: 32,
                      bottom: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(widget.timeFormatted,
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54)),
                          SizedBox(width: 2),
                          //  done
                          Icon(Icons.done_all, size: 14),
                          SizedBox(width: 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ];
// start build
      return Padding(
        padding: const EdgeInsets.only(bottom: 2.0),
        child: Align(
          alignment: widget.isUser ? Alignment.topRight : Alignment.topLeft,
          child: SizedBox(
            width: constraint.maxWidth * 0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: widget.isUser
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // some manipulation to reorder row
                  children: widget.isUser ? rowKids.reversed.toList() : rowKids,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
