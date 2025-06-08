import 'package:expense_app_bloc/core/constants/app_constants.dart';
import 'package:expense_app_bloc/core/models/expense_model.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_bloc.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_event.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_state.dart';
import 'package:expense_app_bloc/shared/widget/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../authentication/widgets/registration_textfield.dart';

class AddExpensePage extends StatefulWidget {
  const AddExpensePage({super.key});

  @override
  State<AddExpensePage> createState() => _AddExpensePageState();
}

class _AddExpensePageState extends State<AddExpensePage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  int selectedCatIndex = -1;
  List<String> mExpType = ["Debit", "Credit"];
  String selectedExpType = "Debit";
  bool isLoading = false;

  DateTime? selectedDate;
  DateFormat dateFormat = DateFormat.yMMMEd();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              RegistrationTextField(
                validator: (title) {
                  if (title == null || title.isEmpty) {
                    return "Title cannot be empty";
                  }
                  return null;
                },
                hintText: "Title",
                controller: titleController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              RegistrationTextField(
                validator: (description) {
                  if (description == null || description.isEmpty) {
                    return "Description cannot be empty";
                  }
                  return null;
                },
                hintText: "Description",
                controller: descriptionController,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 10),
              RegistrationTextField(
                validator: (amount) {
                  if (amount == null || amount.isEmpty) {
                    return "Amount cannot be empty";
                  }
                  final double? value = double.tryParse(amount);
                  if (value == null || value <= 0) {
                    return "Please enter a valid amount";
                  }
                  return null;
                },
                hintText: "Amount",
                controller: amountController,
                keyboardType: TextInputType.number,
              ),
              spacerH(),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(15),
                                width: double.infinity,
                                height: 400,
                                child: GridView.builder(
                                    itemCount: AppConstants.mCat.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4),
                                    itemBuilder: (_, index) {
                                      return InkWell(
                                        onTap: () {
                                          setState(() {
                                            selectedCatIndex = index;
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              AppConstants.mCat[index]
                                                  ["catImage"],
                                              width: 50,
                                              height: 50,
                                            ),
                                            Text(AppConstants.mCat[index]
                                                ["catName"]),
                                          ],
                                        ),
                                      );
                                    }),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          // splashFactory: NoSplash.splashFactory, // Remove splash effect
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      // .copyWith(
                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      // ),
                      child: selectedCatIndex >= 0
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    AppConstants.mCat[selectedCatIndex]
                                            ["catName"] +
                                        " - ",
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Image.asset(
                                    AppConstants.mCat[selectedCatIndex]
                                        ["catImage"],
                                    width: 25,
                                    height: 25,
                                  ),
                                ],
                              ),
                            )
                          : Text("Choose Category"))),
              spacerH(),

              // DropdownButton(
              //     value: selectedExpType,
              //     items: mExpType.map((e)=>
              // DropdownMenuItem(value: e,child: Text(e) , )
              // ).toList(), onChanged: (value){
              //       selectedExpType = value!;
              //       setState(() {});
              // }),

              //Method :1
              // DropdownMenu(
              //     textAlign: TextAlign.center,
              //     width: double.infinity,
              //     initialSelection: selectedExpType,
              //     inputDecorationTheme: InputDecorationTheme(
              //       enabledBorder: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         borderSide: BorderSide(color: Colors.black, width: 1),
              //       ),
              //       // border: OutlineInputBorder(
              //       //   borderRadius: BorderRadius.circular(10),
              //       //   borderSide: BorderSide(color: Colors.black, width: 1),
              //       // ),
              //     ),
              //     onSelected: (value) {
              //       selectedExpType = value!;
              //       // selfDefine setState to update the UI
              //       // setState(() {});
              //     },
              //     dropdownMenuEntries: mExpType
              //         .map((e) => DropdownMenuEntry(value: e, label: e))
              //         .toList()),

              //Method :2

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: mExpType
                    .map((e) => RadioMenuButton(
                        value: e,
                        groupValue: selectedExpType,
                        onChanged: (value) {
                          selectedExpType = value!;
                          setState(() {});
                        },
                        child: Text(e)))
                    .toList(),
              ),

              spacerH(),
              SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                        selectedDate = await showDatePicker(
                            context: context,
                            firstDate:
                                DateTime.now().subtract(Duration(days: 730)),
                            lastDate: DateTime.now());
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          // splashFactory: NoSplash.splashFactory, // Remove splash effect
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      // .copyWith(
                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      // ),
                      child: Text(
                          dateFormat.format(selectedDate ?? DateTime.now())))),

              spacerH(),

              BlocListener<ExpenseBloc, ExpenseState>(
                listener: (_, state) {
                  if (state is ExpenseLoadingState) {
                    isLoading = true;
                    // print("Expense is loading");
                    setState(() {});
                  } else if (state is ExpenseFailureState) {
                    // print("Expense failed");
                    isLoading = false;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: Colors.red,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.error)));
                  } else if (state is ExpenseSuccessState) {
                    // print("Expense added successfully");
                    isLoading = false;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Expense added successfully"),
                        backgroundColor: Colors.green,
                      ),
                    );
                    Navigator.pop(context);
                  }
                },
                child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: selectedCatIndex >= 0 &&
                              selectedExpType.isNotEmpty
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                context
                                    .read<ExpenseBloc>()
                                    .add(AddingExpenseEvent(
                                      model: ExpenseModel(
                                          title: titleController.text,
                                          description:
                                              descriptionController.text,
                                          amount: double.parse(
                                              amountController.text),
                                          balance: double.parse(
                                              amountController.text),
                                          categoryId: selectedCatIndex >= 0
                                              ? AppConstants
                                                      .mCat[selectedCatIndex]
                                                  ["catId"]
                                              : 0,
                                          type: selectedExpType == "Debit"
                                              ? 1
                                              : 2,
                                          createdAt:
                                              (selectedDate ?? DateTime.now())
                                                  .millisecondsSinceEpoch
                                                  .toString()),
                                    ));
                                // createdAt: dateFormat.format(
                                //                 selectedDate ?? DateTime.now()))));
                              }

                              ///exp model
                              ///bloc
                              ///event
                              ///state
                              ///dbHelper
                            }
                          : () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text("Please fill all fields correctly"),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          // elevation: 0,
                          // backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          backgroundColor:
                              // titleController.text.isNotEmpty &&
                              //         descriptionController.text.isNotEmpty &&
                              //         amountController.text.isNotEmpty &&
                              //         selectedCatIndex >= 0 &&
                              //         selectedExpType.isNotEmpty
                              //     ?
                              Colors.deepPurple
                          // : Colors.grey
                          ,
                          // splashFactory: NoSplash.splashFactory, // Remove splash effect
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(10),
                          )),
                      // .copyWith(
                      // overlayColor: MaterialStateProperty.all(Colors.transparent),
                      // ),
                      child: isLoading
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                                spacerW(),
                                Text("Adding Expense...")
                              ],
                            )
                          : Text("Add Expense"),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
