import 'package:expense_app_bloc/core/constants/app_constants.dart';
import 'package:expense_app_bloc/shared/widget/global.dart';
import 'package:flutter/material.dart';

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
  int selectedCatIndex=-1;



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
      appBar: AppBar(
        title: const Text("Add Expense"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
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
                                      onTap: (){
                                        setState(() {
                                          selectedCatIndex = index;
                                        });
                                        Navigator.pop(context);
                                      },
                                      child: Column(
                                        children: [
                                          Image.asset(AppConstants.mCat[index]["catImage"],width: 50,height: 50,),
                                          Text(AppConstants.mCat[index]["catName"]),
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
                    child: selectedCatIndex>=0 ?Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppConstants.mCat[selectedCatIndex]["catName"] + " - ",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Image.asset(AppConstants.mCat[selectedCatIndex]["catImage"],width: 25,height: 25,),
                        ],
                      ),
                    ) :Text("Choose Category"))),
            spacerH(),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        // overlayColor: Colors.transparent, // Remove overlay color means onClick changed Color
                        shadowColor: Colors.transparent, // Remove shadow
                        // splashFactory: NoSplash.splashFactory, // Remove ripple/splash effect
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    // .copyWith(
                    // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    // ),
                    child: selectedCatIndex>=0 ?Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppConstants.mCat[selectedCatIndex]["catName"] + " - ",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Image.asset(AppConstants.mCat[selectedCatIndex]["catImage"],width: 25,height: 25,),
                        ],
                      ),
                    ) :Text("Select Type"))),
            spacerH(),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
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
                    child: selectedCatIndex>=0 ?Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(AppConstants.mCat[selectedCatIndex]["catName"] + " - ",
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
                          Image.asset(AppConstants.mCat[selectedCatIndex]["catImage"],width: 25,height: 25,),
                        ],
                      ),
                    ) :Text("Select Date"))),
            spacerH(),
            SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                        // elevation: 0,
                        // backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.deepPurple,
                        // splashFactory: NoSplash.splashFactory, // Remove splash effect
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        )),
                    // .copyWith(
                    // overlayColor: MaterialStateProperty.all(Colors.transparent),
                    // ),
                    child: Text("Add Expense"),
                )
            ),

          ],
        ),
      ),
    );
  }
}
