
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_application/screens/login_page.dart';

import '../model/todo_model.dart';

class TodoPage extends StatefulWidget {

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  late CollectionReference allData;


  String? userId;

  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserId();
  }

  getUserId()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getString(LoginPage.USER_ID);
    print('todo page: $userId');
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    allData = fireStore.collection('users').doc(userId).collection('notes');


    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: userId != null ?
      FutureBuilder(
        future: fireStore.collection('users').doc(userId).collection('notes').get(),
        builder: (context, snapshot) {
          if( snapshot.connectionState==ConnectionState.waiting ){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Center(child: Text('Error: ${snapshot.hasError}'));
          }

          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.size,
              itemBuilder: (context, index) {
                return const ListTile(
                  title: Text('Test 1'),
                );
              },
            );
          }
          return Container();
        },

      ) : const Center(child: Text('No Notes')),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {

          showModalBottomSheet(
            context: context,
            builder: (context) {
              return customBottomSheet();
            },
          );

        },
        child: const Icon(Icons.add),
      ),
    );
  }


  Widget customBottomSheet(){
    return Container(
      height: 400,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: descController,
              decoration: const InputDecoration(),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: ()async {
                      var todoNotes = TodoModel(
                        userId: userId,
                        title: titleController.text,
                        desc: descController.text,
                        createdAt: dateFormat.format(DateTime.now()),
                        completedAt: dateFormat.format(DateTime.now()),

                      );

                      await allData.add(todoNotes.toMapDoc());
                      Navigator.pop(context);
                    },
                    child: const Text('Save')
                ),

                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}