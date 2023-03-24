import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/pages/todo.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatefulWidget {
  final Todo todo;
  const TodoTile({super.key, required this.todo});

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoProvider>(context);
    final todo = widget.todo;

    Color getColor() {
      if (provider.currentDate == todo.date) {
        return Colors.blue;
      } else {
        return Colors.white;
      }
    }

    return SizedBox(
      height: 90,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 2,
        color: getColor(),
        child: Slidable(
          key: Key('$provider'),
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  provider.toggleToBeDeleted(todo);
                },
                backgroundColor: Colors.red,
                icon: Icons.delete,
              ),
              SlidableAction(
                onPressed: (context) {
                  provider.toggleIsComplete(todo);
                },
                backgroundColor: Colors.green,
                icon: Icons.airplane_ticket,
              ),
            ],
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Padding(padding: EdgeInsets.only(right: 5)),
            Expanded(
              child: InkWell(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TodoPage(todo: todo)),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: Text(
                          todo.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                      Row(children: [
                        Visibility(
                          child: Text(
                            todo.date + ' ',
                            style: const TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Text(
                          todo.time,
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ]),
                    ]),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => provider.toggleToBeDeleted(todo),
                  child: todo.toBeDeleted
                      ? const Icon(Icons.read_more)
                      : const Text(""),
                ),
                const Spacer(),
                Text(
                  todo.category,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
