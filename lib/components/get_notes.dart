import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/components/default_button.dart';
import 'package:taxi_app/size_config.dart';
import 'package:taxi_app/theme.dart';

class GetNotes extends StatefulWidget {
  GetNotes({this.prefilledText = '', Key? key}) : super(key: key);
  String prefilledText;

  @override
  State<GetNotes> createState() => _GetNotesState();
}

class _GetNotesState extends State<GetNotes> {
  final myController = TextEditingController();
  @override
  void initState() {
    myController.text = widget.prefilledText;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).viewPadding.top,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(FeatherIcons.chevronLeft),
                ),
              ),
              Container(
                color: Colors.transparent,
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Add Notes',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Text('           '),
            ],
          ),
          const Divider(),
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: myController,
              decoration: const InputDecoration(
                hintText: 'Add your notes here!',
                prefixIcon: Icon(
                  Icons.file_open_sharp,
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
          const Expanded(child: SizedBox()),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DefaultButton(
              text: "Update notes",
              press: () {
                Navigator.of(context).pop(myController.text);
              },
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
      // floatingActionButton: Container(
      //   height: kToolbarHeight,
      //   width: MediaQuery.of(context).size.width - 30,
      //   child: ElevatedButton(
      //     onPressed: () {
      //       Navigator.of(context).pop(myController.text);
      //     },
      //     child: const Text(
      //       'Add Notes',
      //       style: TextStyle(
      //         color: Colors.white,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
