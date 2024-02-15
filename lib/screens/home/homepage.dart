import '/_helpers/themes/my_colors.dart';
import '/widgets/custom_bottom_modal_sheet.dart';
import '/_helpers/config/config.dart';
import '/_helpers/size_utils.dart';
import '/_helpers/utils.dart';
import '../../models/service_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final Function(dynamic) requestOpenSearchDelegate;

  const HomePage({
    super.key,
    required this.requestOpenSearchDelegate,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final GlobalKey _key;
  late final List<ServiceModel> services;
  late final ScrollController scrollController;

  Widget generateServiceCard(BuildContext context, ServiceModel serviceModel,
      int idx, int totalServiceCount, Function onClick) {
    var docReq = serviceModel.documetsRequired;
    return Padding(
      padding: getPadding(
          left: 15, right: 15, bottom: idx == totalServiceCount - 1 ? 150 : 8),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: getPadding(left: 12, right: 12, bottom: 10, top: 10),
          child: SizedBox(
            height: 130,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      serviceModel.name,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: setWidth(20)),
                    ),
                    serviceModel.id != 'it_services'
                        ? Container(
                            width: setWidth(100),
                            padding: getPadding(all: 5),
                            decoration: BoxDecoration(
                                color: MyColors.green800,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text(
                                "Rs. ${int.parse(serviceModel.price) - 1}-${int.parse(serviceModel.price) + 999}",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: setWidth(11),
                                      color: MyColors.white,
                                    ),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
                space(0, 8),
                Flexible(
                  // fit: FlexFit.tight,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      serviceModel.desc,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.normal, fontSize: 12),
                      softWrap: true,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Docs Req: ",
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: setWidth(10),
                                  ),
                        ),
                        space(0, 2),
                        Row(
                          children: List.generate(
                            docReq.length,
                            (index) => Text(
                              docReq[index] != "none"
                                  ? (index == docReq.length - 1
                                      ? "${docReq[index]}"
                                      : "${docReq[index]}, ")
                                  : "-",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                    fontSize: setWidth(10),
                                  ),
                              softWrap: true,
                            ),
                          ),
                        )
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: FilledButton(
                        onPressed: () => onClick(context, serviceModel.id),
                        child: const Text("Apply"),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget button(String text, String price, Function onClick) {
    return Padding(
      padding: getPadding(left: 20, right: 20, top: 5, bottom: 5),
      child: SizedBox(
        height: setHeight(60),
        child: MaterialButton(
          onPressed: () => onClick(),
          elevation: 3,
          child: Padding(
            padding: getPadding(all: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(text),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Rs. $price"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> generateButtonList(ServiceModel serviceModel) {
    switch (serviceModel.id) {
      case 'gst':
        return List.generate(serviceModel.types.length, (index) {
          return button(serviceModel.types[index] ?? serviceModel.name,
              serviceModel.price, () {
            print(serviceModel.types[index]);
          });
        });
      default:
        return List.generate(serviceModel.types.length, (index) {
          return button(serviceModel.types[index] ?? serviceModel.name,
              serviceModel.price, () {
            print(serviceModel.types[index]);
          });
        });
    }
  }

  void handleClick(context, id) {
    // context.go("/payment/$id");
    ServiceModel serviceModel = services.firstWhere((e) => e.id == id);
    List<Widget> list = generateButtonList(serviceModel);
    showModalBottomSheet(
      context: context,
      builder: (context) => CustomBottomSheetModal(
        key: _key,
        serviceId: id,
        list: list,
        header: serviceModel.name,
      ),
    );
  }

  @override
  void initState() {
    _key = GlobalKey();
    scrollController = ScrollController();
    scrollController.addListener(() {
      print(scrollController.positions);
    });
    // fetch list of items here
    services = serviceAvailabe.map((e) => ServiceModel.fromMap(e)).toList();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;
    return SizedBox(
      height: screen.height,
      width: screen.width,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: services.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (_, index) {
                return generateServiceCard(
                  context,
                  services[index],
                  index,
                  services.length,
                  handleClick,
                );

                // return Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: MaterialButton(
                //     elevation: 16,
                //     color: Colors.green,
                //     onPressed: () => handleClick(context, services[index].id),
                //     child: Container(
                //       alignment: Alignment.center,
                //       height: 200,
                //       child: Center(child: Text(services[index].name)),
                //     ),
                //   ),
                // );

                // return InkWell(
                //   onTap: () => handleClick(context, services[index].id),
                //   child: Container(
                //     padding: getPadding(
                //       left: 20,
                //       right: 20,
                //       top: index == 0 ? 20 : 0,
                //       bottom: index == serviceAvailabe.length - 1 ? 20 : 0,
                //     ),
                //     child: CustomCard(
                //       borderRadius: 12,
                //       bgColor: randomColors(10)[0],
                //       height: setHeight(160),
                //       width: setWidth(300),
                //       child: Container(
                //         alignment: Alignment.center,
                //         height: 200,
                //         child: Center(child: Text(services[index].name)),
                //       ),
                //     ),
                //   ),
                // );
              },
            ),
          ),
        ],
      ),
    );
  }
}
