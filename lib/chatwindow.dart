import 'package:chitchat/chatmeassage.dart';
import 'package:flutter/material.dart';

class Chatwindow extends StatefulWidget {
  @override
  _ChatwindowState createState() => _ChatwindowState();
}

class _ChatwindowState extends State<Chatwindow> {
  final TextEditingController _textcontroller = new TextEditingController();

  final List<Chatmeassge> _messages = <Chatmeassge>[];

  void _handleSubmitted(String text) {
    _textcontroller.clear();
    Chatmeassge message = new Chatmeassge(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _textComposerWidget() {
    return IconTheme(
      data: new IconThemeData(
        color: Colors.blue,
      ),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
                controller: _textcontroller,
                onSubmitted: _handleSubmitted,
              ),
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textcontroller.text),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
          child: new ListView.builder(
            padding: new EdgeInsets.all(0.0),
            reverse: true,
            itemBuilder: (_, int index) => _messages[index],
            itemCount: _messages.length,
          ),
        ),
        new Divider(height: 1.0),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        ),
      ],
    );
  }
}
