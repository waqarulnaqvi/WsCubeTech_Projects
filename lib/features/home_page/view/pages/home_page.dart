import 'dart:math';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_bloc.dart';
import 'package:expense_app_bloc/features/home_page/view/viewmodel/bloc/expense_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_constants.dart';
import '../viewmodel/bloc/expense_event.dart';
import 'add_expense_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> filterType = [
    {
      "catId": 1,
      "cateType": "Date wise",
    },
    {
      "catId": 2,
      "cateType": "Month wise",
    },
    {
      "catId": 3,
      "cateType": "Year wise",
    },
    {
      "catId": 4,
      "cateType": "Category wise",
    }
  ];

  Map<String, dynamic> selectedFilterType = {
    "catId": 1,
    "cateType": "Date wise",
  };

  // num totalExpense = 0;

  @override
  void initState() {
    super.initState();
    // print("Selected Filter Type: ${selectedFilterType['cateType']}");
    context
        .read<ExpenseBloc>()
        .add(ExpenseInitialEvent(filterType: selectedFilterType['catId']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(
            'assets/images/splash_image-logo.png',
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, size: 30, color: Colors.black),
          ),
        ],
        title: Text(
          "Expense",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: BlocBuilder<ExpenseBloc, ExpenseState>(builder: (context, state) {
        if (state is ExpenseLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ExpenseFailureState) {
          return Center(
            child: Text("Error: ${state.error}"),
          );
        } else if (state is ExpenseSuccessState) {
          // print("Expense Success State: ${state.mExpenses.length}");

          var allDate = state.mExpenses;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 62,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0XFFFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        SizedBox(width: 8),
                        Icon(Icons.person, size: 30),
                        SizedBox(width: 10),
                        Column(
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "Morning",
                              style: TextStyle(
                                color: Color(0XFF96989F),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Waqarul",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        Expanded(child: Container()),
                        Container(
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: DropdownMenu(
                                textStyle: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                                inputDecorationTheme: InputDecorationTheme(
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    )),
                                // menuStyle: MenuStyle(
                                //   padding: MaterialStateProperty.all(
                                //       EdgeInsets.zero), // Remove extra padding
                                // ),
                                initialSelection:
                                selectedFilterType['cateType'],
                                onSelected: (value) {
                                  // if(value == null) return;
                                  // print("\n\nSelected Value: $value"); ///Why this value is empty

                                  if (value == "Date wise") {
                                    selectedFilterType = {
                                      "catId": 1,
                                      "cateType": "Date wise",
                                    };
                                  } else if (value == "Month wise") {
                                    selectedFilterType = {
                                      "catId": 2,
                                      "cateType": "Month wise",
                                    };
                                  } else if (value == "Year wise") {
                                    selectedFilterType = {
                                      "catId": 3,
                                      "cateType": "Year wise",
                                    };
                                  } else if (value == "Category wise") {
                                    selectedFilterType = {
                                      "catId": 4,
                                      "cateType": "Category wise",
                                    };
                                  } else {
                                    selectedFilterType = {
                                      "catId": 2,
                                      "cateType": "Month wise",
                                    };
                                  }

                                  // print(
                                  //     "Selected Filter Type: $selectedFilterType");

                                  // int filterValue;
                                  // if (selectedFilterType['catT'] == "Date wise") {
                                  //   filterValue = 1;
                                  // } else if (selectedFilterType ==
                                  //     "Month wise") {
                                  //   filterValue = 2;
                                  // } else if (selectedFilterType ==
                                  //     "Year wise") {
                                  //   filterValue = 3;
                                  // } else {
                                  //   filterValue = 4;
                                  // }
                                  // print("Selected Filter Type: ${selectedFilterType['catId']}");

                                  context.read<ExpenseBloc>().add(
                                      ExpenseInitialEvent(
                                          filterType:
                                          selectedFilterType['catId']));
                                },
                                dropdownMenuEntries: filterType.map(
                                      (e) {
                                    // print("Dropdown Entry: ${e['cateType']}");
                                    return DropdownMenuEntry(
                                        value: e['cateType'],
                                        label: e['cateType']);
                                  },
                                ).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // Total Expense
                  Container(
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0XFF6574D3),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Expense total",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 3),
                              Text(
                                "\$",
                                // "\$ ${totalExpense==0? "0,0" : totalExpense.toString()}",
                                style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Color(0XFFD06160),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Text(
                                        "+\$240",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Text(
                                    "than last month",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Image.asset('assets/images/expense_app_images.jpg'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'Expense List',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  // Expanded(
                  //   child: ListView(
                  //     children: [
                  //       _buildExpenseItem('Shop', '-\$90'),
                  //       _buildExpenseItem('Electronic', '-\$1290'),
                  //       _buildExpenseItem('Transportation', '-\$60'),
                  //     ],
                  //   ),
                  // ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (_, index) {
                      // totalExpense += allDate[index].bal;

                      return Container(
                          padding: EdgeInsets.all(11),
                          margin: EdgeInsets.only(bottom: 11),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    allDate[index].title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  Spacer(),
                                  Text(allDate[index].bal.toString(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: allDate[index].bal > 0
                                            ? Colors.green
                                            : Colors.red,
                                      )),
                                ],
                              ),
                              SizedBox(height: 5),
                              Divider(),
                              SizedBox(height: 5),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index2) {
                                    var eachExpense =
                                    allDate[index].allExp[index2];
                                    return _buildExpenseItem(
                                      AppConstants.mCat.firstWhere(
                                        //First where is a higher order function in flutter
                                              (element) =>
                                          element['catId'] ==
                                              eachExpense
                                                  .categoryId)['catImage'],
                                      eachExpense.title,
                                      eachExpense.description,
                                      eachExpense.amount.toString(),
                                    );
                                  },
                                  itemCount: allDate[index].allExp.length),
                            ],
                          ));
                    },
                    itemCount: allDate.length,
                  )
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("No expenses found"),
          );
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddExpensePage()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),

    );
  }

  Widget _buildExpenseItem(
      String image, String title, String desc, String amount) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(image),
        backgroundColor: Colors
            .primaries[Random().nextInt(Colors.primaries.length)].shade200,
        radius: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black87,
          fontWeight: FontWeight.w400,
        ),
      ),
      subtitle: Text(desc),
      trailing: Text(
        amount,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: Color(0XFFE88DBE),
        ),
      ),
    );
  }
}
