import 'package:flutter/material.dart';
import 'package:spend_record/chart/chart.dart';
import 'package:spend_record/models/expense.dart';
import 'package:spend_record/expenses_List.dart';
import 'package:spend_record/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {

  final List<Expense> _registeredExpenses =[
    Expense(
        title: 'Flutter Course',
        amount: 19.19, date: DateTime.now(),
        category: Category.work
    ),
    Expense(
        title: 'Cinema',
        amount: 50.19, date: DateTime.now(),
        category: Category.leisure
    ),
    Expense(
        title: 'Food',
        amount: 135.19, date: DateTime.now(),
        category: Category.food
    ),
  ];
   void _openAddExpenseOverlay() {

     showModalBottomSheet(
       useSafeArea: true,
       isScrollControlled: true,
       context: context,
         builder: (ctx) => NewExpense( onAddExpense:_addExpense),);
   }
   void _addExpense(Expense expense){
     setState(() {
       _registeredExpenses.add(expense);
     });
   }

   void _removeExpense(Expense expense){
     final expenseIndex =_registeredExpenses.indexOf(expense);
     setState(() {
       _registeredExpenses.remove(expense);
     });
     ScaffoldMessenger.of(context).clearSnackBars();
     ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
           duration: Duration(seconds: 3),
           action: SnackBarAction(label: 'Undo', onPressed: (){
             setState(() {
               _registeredExpenses.insert(expenseIndex, expense);
             });
           }),
           content: Text("Expense Deleted"),),);
   }


  @override

  Widget build(BuildContext context) {
   final width = MediaQuery.of(context).size.width;
    print(MediaQuery.of(context).size.height);
     Widget maincontent = Center(
       child: Text("NO expense found. Start adding some!"),
     );
     if(_registeredExpenses.isNotEmpty){
       maincontent = ExpensesList(expenses : _registeredExpenses,
         onRemoveExpense: _removeExpense,);
     }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Expense Tracker"
        ),
        actions: [
          IconButton(onPressed: _openAddExpenseOverlay,
              icon: Icon(Icons.add))
        ],
      ),
      body: width < 600
          ? Column(
        children: [
          Chart(expenses: _registeredExpenses ,),
          Expanded(child:maincontent,
          ),
        ],
      ) : Row(children: [
        Expanded(child: Chart(expenses: _registeredExpenses ,)),
        Expanded(child:maincontent,
        ),

      ],),
    );
  }
}
