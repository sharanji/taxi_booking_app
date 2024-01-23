// Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     const SizedBox(
                  //       width: 10,
                  //     ),
                  //     Container(
                  //       width: 30,
                  //       height: 30,
                  //       decoration: BoxDecoration(
                  //         color: PRIMARYCOLOR,
                  //         borderRadius: BorderRadius.circular(50),
                  //       ),
                  //       padding: const EdgeInsets.all(5),
                  //       child: const Icon(
                  //         Icons.departure_board,
                  //         color: Colors.white,
                  //         size: 18,
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 30,
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           '$dateformatter -  $timeFormater',
                  //           style: Theme.of(context).textTheme.bodyLarge,
                  //         ),
                  //         const SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text(
                  //           'Usally takes 5 - 10 minutes to pickup',
                  //           style: Theme.of(context).textTheme.caption,
                  //         ),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const Divider(),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 2,
                  //       child: InkWell(
                  //         onTap: () {
                  //           var nowDate = DateTime.now();
                  //           DatePicker.showDatePicker(
                  //             context,
                  //             showTitleActions: true,
                  //             minTime: DateTime(DateTime.now().year,
                  //                 DateTime.now().month, DateTime.now().day),
                  //             maxTime: DateTime(
                  //               nowDate.year,
                  //               nowDate.month,
                  //               nowDate.day + 2,
                  //             ),
                  //             // onChanged: (date) {
                  //             //   print('change $date');
                  //             // },
                  //             onConfirm: (date) async {
                  //               final TimeOfDay? selectedTime =
                  //                   await showTimePicker(
                  //                 context: context,
                  //                 initialTime: timeOfDay,
                  //                 initialEntryMode: TimePickerEntryMode.dial,
                  //                 confirmText: "CONFIRM",
                  //                 cancelText: "NOT NOW",
                  //                 helpText: "BOOKING TIME",
                  //               );
                  //               if (selectedTime != null) {
                  //                 timeOfDay = selectedTime;
                  //                 if (date.day == DateTime.now().day &&
                  //                     date.month == DateTime.now().month &&
                  //                     date.year == DateTime.now().year) {
                  //                   if (timeOfDay.hour < TimeOfDay.now().hour) {
                  //                     timeOfDay = TimeOfDay.now();
                  //                   } else if (timeOfDay.hour ==
                  //                           TimeOfDay.now().hour &&
                  //                       timeOfDay.minute <
                  //                           TimeOfDay.now().minute) {
                  //                     timeOfDay = TimeOfDay.now();
                  //                   }
                  //                 }
                  //                 var timeOfDayHour = timeOfDay.hour;
                  //                 String timeOfDayMinute =
                  //                     timeOfDay.minute.toString();
                  //                 String amPm = 'AM';
                  //                 if (timeOfDay.hour > 12) {
                  //                   amPm = 'PM';
                  //                   timeOfDayHour = timeOfDay.hour - 12;
                  //                 }
                  //                 if (timeOfDay.minute < 10) {
                  //                   timeOfDayMinute = '0${timeOfDay.minute}';
                  //                 }
                  //                 setState(() {
                  //                   // ignore: prefer_interpolation_to_compose_strings
                  //                   timeFormater = timeOfDayHour.toString() +
                  //                       ':' +
                  //                       timeOfDayMinute +
                  //                       " " +
                  //                       amPm;
                  //                   dateformatter =
                  //                       DateFormat.yMMMMd('en_US').format(date);
                  //                 });
                  //               }
                  //             },
                  //             currentTime: DateTime.now(),
                  //             locale: LocaleType.en,
                  //           );
                  //         },
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Container(
                  //               margin: const EdgeInsets.only(left: 10),
                  //               height: 30,
                  //               child: const Icon(Icons.speaker_notes,
                  //                   color: PRIMARYCOLOR),
                  //             ),
                  //             const Text(
                  //               'Now',
                  //               style: TextStyle(
                  //                 color: PRIMARYCOLOR,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             const Icon(FeatherIcons.chevronDown,
                  //                 color: PRIMARYCOLOR),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       // width: MediaQuery.of(context).size.width / 2,
                  //       child: InkWell(
                  //         onTap: () async {
                  //           var notes = await Navigator.of(context)
                  //               .push(MaterialPageRoute(
                  //             builder: (context) =>
                  //                 GetNotes(prefilledText: userNotes),
                  //           ));
                  //           if (!mounted) return;
                  //           setState(() {
                  //             userNotes = notes;
                  //           });
                  //         },
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             const SizedBox(
                  //               width: 10,
                  //               height: 30,
                  //             ),
                  //             const Icon(Icons.speaker_notes,
                  //                 color: PRIMARYCOLOR),
                  //             const SizedBox(width: 10),
                  //             Text(
                  //               userNotes == '' ? 'Add notes' : 'Edit Notes',
                  //               style: const TextStyle(
                  //                 color: PRIMARYCOLOR,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             const SizedBox(width: 10),
                  //             const Icon(FeatherIcons.chevronDown,
                  //                 color: PRIMARYCOLOR),
                  //             const SizedBox(width: 10),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Divider(),
                  // Row(
                  //   children: [
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 2,
                  //       child: InkWell(
                  //         onTap: () {},
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: const [
                  //             SizedBox(
                  //               width: 10,
                  //             ),
                  //             Icon(Icons.speaker_notes, color: PRIMARYCOLOR),
                  //             SizedBox(width: 10),
                  //             Text(
                  //               'Payment medthod ',
                  //               style: TextStyle(
                  //                 color: PRIMARYCOLOR,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             SizedBox(width: 10),
                  //             Icon(FeatherIcons.chevronDown, color: PRIMARYCOLOR),
                  //             SizedBox(height: 30),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width / 2,
                  //       child: InkWell(
                  //         onTap: () async {},
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: const [
                  //             SizedBox(
                  //               width: 10,
                  //               height: 30,
                  //             ),
                  //             Icon(FeatherIcons.tag, color: PRIMARYCOLOR),
                  //             SizedBox(width: 10),
                  //             Text(
                  //               'No promo code',
                  //               style: TextStyle(
                  //                 color: PRIMARYCOLOR,
                  //                 fontWeight: FontWeight.bold,
                  //               ),
                  //             ),
                  //             SizedBox(width: 10),
                  //             Icon(FeatherIcons.chevronDown, color: PRIMARYCOLOR),
                  //             SizedBox(width: 10),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // const Divider(),
                  // Container(
                  //   // price
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(20),
                  //       bottomRight: Radius.circular(20),
                  //     ),
                  //     color: Colors.white,
                  //   ),
                  //   margin: const EdgeInsets.only(bottom: 10),
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             '₹ 544.25 ',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .headlineSmall!
                  //                 .copyWith(color: kPrimaryColor),
                  //           ),
                  //           const SizedBox(
                  //             width: 20,
                  //           ),
                  //           Text(
                  //             '₹ 600.25 ',
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .headlineSmall!
                  //                 .copyWith(
                  //                   decoration: TextDecoration.lineThrough,
                  //                   color: kSecondaryColor,
                  //                 ),
                  //           ),
                  //           IconButton(
                  //             onPressed: () {},
                  //             icon: const Icon(
                  //               Icons.info_outline,
                  //               color: kPrimaryColor,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           if (widget.hours != 0)
                  //             Text(
                  //               '${widget.hours} hours ',
                  //               style: const TextStyle(
                  //                 color: Colors.green,
                  //                 fontSize: 18,
                  //               ),
                  //             ),
                  //           Text(
                  //             '${widget.minutes} mins ',
                  //             style: const TextStyle(
                  //               color: Colors.green,
                  //               fontSize: 18,
                  //             ),
                  //           ),
                  //           Text(
                  //             ' ( ${widget.distance} km )',
                  //             style: Theme.of(context).textTheme.bodyMedium,
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ), // Container(
                  //   // pin info
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 20,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     // borderRadius: BorderRadius.circular(10),
                  //     gradient: LinearGradient(
                  //       colors: [kPrimaryColor, HexColor("#6F56E8")],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.bottomRight,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       const Flexible(
                  //         fit: FlexFit.tight,
                  //         child: Text(
                  //           'A pin is generated on ride confirmation.It will be verified at he time of pickup.',
                  //           style: TextStyle(color: Colors.white, fontSize: 15),
                  //         ),
                  //       ),
                  //       IconButton(
                  //         onPressed: () {},
                  //         icon: const Icon(
                  //           Icons.chevron_right_rounded,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),