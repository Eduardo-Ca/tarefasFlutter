import 'package:flutter/material.dart';
import 'package:projeto1/componenents/difficulty.dart';
import 'package:projeto1/data/task_dao.dart';

class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  Task(this.nome, this.foto, this.dificuldade, {Key? key}) : super(key: key);

  int nivel = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.black54,
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: (widget.nivel < 5)
                    ? Colors.green
                    : (widget.nivel >= 5) && (widget.nivel < 15)
                        ? Colors.yellow
                        : Colors.red,
              ),
              height: 140,
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black45,
                  ),
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black54,
                        ),
                        height: 100,
                        width: 82,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: Image.network(
                            widget.foto,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(widget.nome,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  overflow: TextOverflow.ellipsis,
                                )),
                          ),
                          Difficulty(
                            dificuldadeLevel: widget.dificuldade,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 82,
                        width: 82,
                        child: ElevatedButton(
                          onLongPress: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Excluir tarefa'),
                                  content: Text(
                                      'Deseja mesmo excluir essa tarefa?'
                                  ),
                                  actions: [
                                    TextButton(
                                        child: Text('Sim'),
                                        onPressed:  () {
                                            TaskDao().delete(widget.nome);
                                            Navigator.pop(context);
                                            
                                        }

                                    ),
                                    TextButton(
                                        child: Text('Cancelar'),
                                        onPressed: () => Navigator.pop(context)
                                    ),
                                  ],
                                ));

                          },
                          onPressed: () {
                            setState(() {
                              widget.nivel++;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Icon(Icons.arrow_drop_up),
                              Text(
                                'UP',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 210,
                        child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.dificuldade > 0)
                              ? (widget.nivel / widget.dificuldade) / 10
                              : 1,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Nivel: ${widget.nivel}',
                          style: const TextStyle(
                            color: Colors.white54,
                            fontSize: 25,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
