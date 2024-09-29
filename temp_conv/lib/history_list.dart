import 'package:flutter/material.dart';

class HistoryList extends StatelessWidget {
  final List<Map<String, String>> history;

  HistoryList({required this.history});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: history.length,
      itemBuilder: (context, index) {
        Map<String, String> historyItem = history[index];
        return ListTile(
          title: Text(
              '${historyItem['conversion']} ${historyItem['value']} => ${historyItem['result']}'),
        );
      },
    );
  }
}
