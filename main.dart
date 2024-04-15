import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksModel(),
    child: MyApp(),
  ));
}

class TasksModel extends ChangeNotifier {
  List<String> _tasks = [];
  List<bool> _taskCompletion = [];

  List<String> get tasks => _tasks;
  List<bool> get taskCompletion => _taskCompletion;

  void addTask(String task) {
    _tasks.add(task);
    _taskCompletion.add(false);
    notifyListeners(); // Notifica os ouvintes sobre mudanças
  }

  void removeTask(int index) {
    _tasks.removeAt(index);
    _taskCompletion.removeAt(index);
    notifyListeners(); // Notifica os ouvintes sobre mudanças
  }

  void toggleTaskCompletion(int index) {
    _taskCompletion[index] = !_taskCompletion[index];
    notifyListeners(); // Notifica os ouvintes sobre mudanças
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color(0xFFE1BEE7),
          centerTitle: true,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de Tarefas'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          Provider.of<TasksModel>(context).tasks.isEmpty
              ? EmptyTaskWidget(onPressed: () => _onItemTapped(1))
              : TasksWidget(),
          AddTaskWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Tarefas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Adicionar Tarefas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class EmptyTaskWidget extends StatelessWidget {
  final void Function() onPressed;

  EmptyTaskWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
              'Você não possui nenhuma tarefa no momento. Gostaria de criar alguma?',
              textAlign: TextAlign.center),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: onPressed,
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color(0xFFD1C4E9),
          ),
        ],
      ),
    );
  }
}

class TasksWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tasksModel = Provider.of<TasksModel>(context);
    return ListView.separated(
      itemCount: tasksModel.tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(tasksModel.tasks[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            tasksModel.removeTask(index);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white, size: 30),
          ),
          child: ListTile(
            title: Text(tasksModel.tasks[index]),
            trailing: Checkbox(
              value: tasksModel.taskCompletion[index],
              onChanged: (bool? newValue) {
                tasksModel.toggleTaskCompletion(index);
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(color: Colors.grey[800], thickness: 1),
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Tarefa',
              border: OutlineInputBorder(),
              hintText: 'Digite uma nova tarefa',
            ),
            onSubmitted: (value) {
              if (value.isNotEmpty) {
                Provider.of<TasksModel>(context, listen: false).addTask(value);
                _textController.clear();
                FocusScope.of(context).unfocus();
              }
            },
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_textController.text.isNotEmpty) {
              Provider.of<TasksModel>(context, listen: false).addTask(_textController.text);
              _textController.clear();
              FocusScope.of(context).unfocus();
            }
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
