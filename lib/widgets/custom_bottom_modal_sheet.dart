import '/_helpers/utils.dart';
import '../models/service_model.dart';
import 'package:flutter/material.dart';
import '../_helpers/size_utils.dart';

class CustomBottomSheetModal extends StatefulWidget {
  const CustomBottomSheetModal({
    super.key,
    this.serviceId,
    this.modalHeight,
    this.list,
    this.header,
  });
  final String? serviceId;
  final double? modalHeight;
  final List<Widget>? list;
  final String? header;

  @override
  State<CustomBottomSheetModal> createState() => _CustomBottomSheetModalState();
}

class _CustomBottomSheetModalState extends State<CustomBottomSheetModal> {
  late final List<Widget> serviceButtonList;
  late final ServiceModel serviceModel;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: setHeight(widget.modalHeight ?? 300),
      width: width,
      child: Column(
        children: [
          space(0, 10),
          Text(
            widget.header ?? "",
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          space(0, 20),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              children: widget.list ?? [],
            ),
          ),
          space(0, 20),
        ],
      ),
    );
  }
}
