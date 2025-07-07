import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _tasks = [];

  void _addTask() {
    final String task = _controller.text.trim();

    if (task.isNotEmpty) {
      setState(() {
        _tasks.add(task);
        _controller.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('📝 To-Do List'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF43cea2), Color(0xFF185a9d)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Input field
                TextField(
                  controller: _controller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white10,
                    labelText: 'Enter a new task',
                    labelStyle: const TextStyle(color: Colors.white70),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      onPressed: _addTask,
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Task list
                Expanded(
                  child: _tasks.isEmpty
                      ? const Center(
                          child: Text(
                            'No tasks yet ✨',
                            style: TextStyle(color: Colors.white70, fontSize: 18),
                          ),
                        )
                      : ListView.builder(
                          itemCount: _tasks.length,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 5,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: ListTile(
                                title: Text(
                                  _tasks[index],
                                  style: const TextStyle(fontWeight: FontWeight.w500),
                                ),
                                trailing: IconButton(
                                  icon: const Icon(Icons.delete_forever),
                                  color: Colors.redAccent,
                                  onPressed: () => _removeTask(index),
                                ),
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
