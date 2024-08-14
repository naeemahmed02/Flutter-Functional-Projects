import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/save_todo_provider.dart';
import 'package:todo_app/screens/add_task.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/list_tile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    print('Home');
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(),
              const SizedBox(height: 40,),
              Text('All ToDos', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              const SizedBox(height: 15,),
              Expanded(
                child: Consumer<SaveTodoProvider>(builder: (context, value, child){
                  return ListView.builder(
                  itemCount: value.todos.length,
                  itemBuilder: (context, index) {
                    return CustomListTile(index: index);
                  },
                );
                })
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pushNamed(context, "add_task");
        },
        child: Icon(Icons.add),
        ),
      ),
    );
  }
}