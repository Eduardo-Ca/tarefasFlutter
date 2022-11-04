import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto1/componenents/AppController.dart';
import 'package:projeto1/componenents/Task.dart';
import 'package:projeto1/data/task_dao.dart';
import 'package:projeto1/screens/form_screen.dart';

class inicialScreen extends StatefulWidget {
  const inicialScreen({Key? key}) : super(key: key);

  @override
  State<inicialScreen> createState() => _inicialScreenState();
}

class _inicialScreenState extends State<inicialScreen> {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        actions: [
          IconButton(onPressed: (){setState(() {});}, icon: Icon(Icons.refresh)),
          Icon(Icons.dark_mode),
          Switch(
              value: AppController.instance.IsDarkTheme,
              onChanged: (value){
                AppController.instance.changeTheme();
              })
        ],
        title: const Text(
          'Tarefas',
          style: TextStyle(fontSize: 25),
        ), //---------
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<Task>>(
            future: TaskDao().findAll(),
            builder: (context, snapshot) {
              List<Task>? items = snapshot.data;
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.active:
                  return Center(
                    child: Column(
                      children: const [
                        CircularProgressIndicator(),
                        Text('Carregando')
                      ],
                    ),
                  );
                  break;
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) {
                            final Task tarefa = items[index];
                            return tarefa;
                          });
                    }
                    return Center(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.error_outline,
                            size: 128,
                          ),
                          Text(
                            'Nâo há nenhuma tarefa',
                            style: TextStyle(fontSize: 32),
                          )
                        ],
                      ),
                    );
                  }
                  return Text('Erro ao carregar Tarefas');
                  break;
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                      taskContext: context,
                    )
            ),
          ).then((value) => setState((){}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
