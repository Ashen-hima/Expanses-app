import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/constant/constant.dart';
import 'package:expence_tracker/models/expense_model.dart';
import 'package:expence_tracker/models/income_model.dart';
import 'package:expence_tracker/service/expence_service.dart';
import 'package:expence_tracker/service/income_service.dart';
import 'package:expence_tracker/widget/custom_buttom.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNewScreen extends StatefulWidget {
  final Function(Expense) addExpense;
  final Function(Income) addIncome;
  const AddNewScreen({
    super.key,
    required this.addExpense,
    required this.addIncome,
  });

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  int _selectedMethod = 0;
  ExpenseModel _expenseModel = ExpenseModel.health;
  IncomeModel _incomeModel = IncomeModel.salary;

  final TextEditingController _titleControler = TextEditingController();
  final TextEditingController _descripController = TextEditingController();
  final TextEditingController _amountcontroller = TextEditingController();

  DateTime _selectedDate = DateTime.now();

  DateTime _selectedTime = DateTime.now();

  @override
  void dispose() {
    _titleControler.dispose();
    _descripController.dispose();
    _amountcontroller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedMethod == 0 ? kRed : kGreen,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: kdefaultpadding),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                child: Container(
                  //rtttttttttttttttttttttttttttttttt
                  height: MediaQuery.of(context).size.height * 0.06,
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 0;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 0 ? kRed : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 10,
                            ),
                            child: Text(
                              "Expence",
                              style: TextStyle(
                                color: _selectedMethod == 0 ? kWhite : kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedMethod = 1;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: _selectedMethod == 1 ? kGreen : kWhite,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60,
                              vertical: 10,
                            ),
                            child: Text(
                              "Income",
                              style: TextStyle(
                                color: _selectedMethod == 1 ? kWhite : kBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.18,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How much?",
                      style: TextStyle(
                        color: kLightGrey,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextField(
                      style: TextStyle(
                        fontSize: 60,
                        color: kWhite,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: "0",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: kWhite,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //user data form
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35,
                ),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(kdefaultpadding),
                  child: Form(
                    child: Column(
                      children: [
                        //category selected dropdown
                        DropdownButtonFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: kdefaultpadding,
                              horizontal: 20,
                            ),
                          ),
                          items:
                              _selectedMethod == 0
                                  ? ExpenseModel.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList()
                                  : IncomeModel.values.map((category) {
                                    return DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name),
                                    );
                                  }).toList(),

                          value:
                              _selectedMethod == 0
                                  ? _expenseModel
                                  : _incomeModel,
                          onChanged: (value) {
                            setState(() {
                              _selectedMethod == 0
                                  ? _expenseModel = value as ExpenseModel
                                  : _incomeModel = value as IncomeModel;
                            });
                          },
                        ),

                        SizedBox(height: 20),

                        //title feild
                        TextFormField(
                          controller: _titleControler,
                          decoration: InputDecoration(
                            hintText: "Title",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: kdefaultpadding,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        //description
                        TextFormField(
                          controller: _descripController,
                          decoration: InputDecoration(
                            hintText: "Description",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: kdefaultpadding,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),

                        //amount
                        TextFormField(
                          controller: _amountcontroller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Amount",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              vertical: kdefaultpadding,
                              horizontal: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        //date picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Builder(
                              builder: (context) {
                                return GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    print("object");
                                    showDatePicker(
                                      context: context,

                                      firstDate: DateTime(2020),
                                      initialDate: DateTime.now(),

                                      lastDate: DateTime(2026),
                                    ).then((value) {
                                      if (value != null) {
                                        setState(() {
                                          _selectedDate = value;
                                        });
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: const Color.fromARGB(
                                        223,
                                        126,
                                        61,
                                        255,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 30,
                                        vertical: 10,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month_outlined,
                                            color: kWhite,
                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            "Select Date",
                                            style: TextStyle(
                                              color: kWhite,
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Text(DateFormat.yMMMd().format(_selectedDate)),
                          ],
                        ),

                        SizedBox(height: 20),

                        //time picker
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value) {
                                  if (value != null) {
                                    setState(() {
                                      _selectedTime = DateTime(
                                        _selectedDate.year,
                                        _selectedDate.month,
                                        _selectedDate.day,
                                        value.hour,
                                        value.minute,
                                      );
                                    });
                                  }
                                });
                              },

                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color.fromARGB(
                                    255,
                                    235,
                                    177,
                                    15,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.timelapse_rounded,
                                        color: kWhite,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Select Time",
                                        style: TextStyle(
                                          color: kWhite,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              DateFormat.jm().format(_selectedTime),
                              style: TextStyle(
                                color: kGrey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Divider(color: kLightGrey, thickness: 5),
                        SizedBox(height: 20),

                        //add button
                        GestureDetector(
                          onTap: () async {
                            ////////////////
                            if (_selectedMethod == 0) {
                              List<Expense> loadedExpenses =
                                  await ExpenceService().loadExpenses();
                              print(loadedExpenses.length);

                              // create the expence to store

                              Expense expense = Expense(
                                id: loadedExpenses.length + 1,
                                title: _titleControler.text,
                                amount:
                                    _amountcontroller.text.isEmpty
                                        ? 0
                                        : double.parse(_amountcontroller.text),
                                category: _expenseModel,
                                date: _selectedDate,
                                time: _selectedTime,
                                description: _descripController.text,
                              );

                              // save the expense
                              widget.addExpense(expense);
                            } else {
                              List<Income> loadedIncome =
                                  await IncomeService().loadIncome();
                              //income--------------------------------------

                              Income income = Income(
                                id: loadedIncome.length + 1,
                                title: _titleControler.text,
                                amount:
                                    _amountcontroller.text.isEmpty
                                        ? 0
                                        : double.parse(_amountcontroller.text),
                                category: _incomeModel,
                                date: _selectedDate,
                                time: _selectedTime,
                                description: _descripController.text,
                              );
                              //add Income
                              widget.addIncome(income);

                              //clear the feilds
                              _titleControler.clear();
                              _amountcontroller.clear();
                              _descripController.clear();
                            }
                          },

                          child: CustomButtom(
                            buttonName: "Add",
                            buttonColor: _selectedMethod == 0 ? kRed : kGreen,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
