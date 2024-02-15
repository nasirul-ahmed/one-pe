import 'package:flutter/material.dart';
import 'package:onepe/_helpers/size_utils.dart';
import 'package:onepe/models/faq_model.dart';

class FAQ extends StatefulWidget {
  const FAQ({super.key});

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  late List<FAQModel> _data;

  List<FAQModel> generateItems(int numberOfItems) {
    return List<FAQModel>.generate(numberOfItems, (int index) {
      return FAQModel(
        question: 'Panel $index',
        answer: 'This is item number $index',
      );
    });
  }

  @override
  void initState() {
    _data = generateItems(5);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: getPadding(top: 20),
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expandedHeaderPadding: EdgeInsets.all(0),
          elevation: 1,
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((FAQModel item) {
            return ExpansionPanel(
              canTapOnHeader: true,
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.question),
                );
              },
              body: ListTile(
                title: Text(item.answer),
              ),
              isExpanded: item.isExpanded,
            );
          }).toList(),
        ),
      ),
    );
  }
}
