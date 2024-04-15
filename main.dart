import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Color(0xFFE1BEE7), // Cor roxo bem claro para a AppBar
          centerTitle: true, // Centraliza o título na AppBar
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20), // Define a cor e tamanho do texto do título
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
  List<String> _tasks = [];
  List<bool> _taskCompletion = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addTask(String task) {
    setState(() {
      _tasks.add(task);
      _taskCompletion.add(false);
      FocusScope.of(context).unfocus(); // Recua o teclado
      _selectedIndex = 0; // Volta para a aba 'Tarefas'
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
      _taskCompletion.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicativo de Tarefas'), // Título centralizado e preto
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            _tasks.isEmpty
                ? EmptyTaskWidget(onPressed: () => _onItemTapped(1))
                : Column(
                    children: [
                      Container(
                        color: Colors.purple[50],
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Deslize para a esquerda para apagar uma tarefa.',
                              style: TextStyle(fontSize: 14),
                            ),
                            Icon(Icons.info_outline, size: 20),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TasksWidget(
                          tasks: _tasks,
                          taskCompletion: _taskCompletion,
                          onTaskToggle: (index) {
                            setState(() {
                              _taskCompletion[index] = !_taskCompletion[index];
                            });
                          },
                          onRemoveTask: _removeTask,
                        ),
                      ),
                    ],
                  ),
            AddTaskWidget(addTask: _addTask),
          ],
        ),
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
  final Function onPressed;

  EmptyTaskWidget({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Você não possui nenhuma tarefa no momento. \nGostaria de criar alguma?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => onPressed(),
            child: Icon(Icons.add, color: Colors.white),
            backgroundColor: Color(0xFFD1C4E9),
          ),
        ],
      ),
    );
  }
}

class TasksWidget extends StatelessWidget {
  final List<String> tasks;
  final List<bool> taskCompletion;
  final Function(int) onTaskToggle;
  final Function(int) onRemoveTask;

  TasksWidget({
    required this.tasks,
    required this.taskCompletion,
    required this.onTaskToggle,
    required this.onRemoveTask,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(tasks[index]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            onRemoveTask(index);
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.delete, color: Colors.white, size: 30),
          ),
          child: ListTile(
            title: Text(tasks[index]),
            trailing: Checkbox(
              value: taskCompletion[index],
              onChanged: (bool? newValue) {
                onTaskToggle(index);
              },
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey[800], // Cinza escuro para a borda entre tarefas
        thickness: 1,
      ),
    );
  }
}

class AddTaskWidget extends StatelessWidget {
  final Function(String) addTask;
  final TextEditingController _textController = TextEditingController();

  AddTaskWidget({required this.addTask});

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
                addTask(value);
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
              addTask(_textController.text);
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
