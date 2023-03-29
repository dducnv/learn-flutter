import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_sqlite/helpers/db_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  void _refreshData() async {
    final data = await DBHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  Future<void> _addData() async {
    await DBHelper.createData(_titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _updateData(int id) async {
    await DBHelper.updateData(id, _titleController.text, _descController.text);
    _refreshData();
  }

  Future<void> _deleteData(int id) async {
    await DBHelper.deleteDatabase(id);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Data Deleted"),
      ),
    );
    _refreshData();
  }

  void showBottomSheet(int? id) {
    if (id != null) {
      final existingData =
          _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descController.text = existingData['desc'];
    }

    modalBottom(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("CRUD with SQLite"),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _allData.length,
              itemBuilder: (context, index) => cardTodo(index)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          _titleController.clear(),
          _descController.clear(),
          showBottomSheet(null)},
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<dynamic> modalBottom(int? id) {
    return showModalBottomSheet(
        elevation: 5,
        isDismissible: true,
        context: context,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                  top: 30,
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 50),
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), hintText: "Title"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _descController,
                      maxLines: 4,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (id == null) {
                            await _addData();
                          }
                          if (id != null) {
                            await _updateData(id);
                          }
                          _titleController.text = "";
                          _descController.text = "";

                          Navigator.pop(context);
                        },
                        child: Text(
                          id == null ? "Add Data" : "Eddit Data",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ]),
            ));
  }

  Dismissible cardTodo(int index) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) => {_deleteData(_allData[index]['id'] as int)},
      child: Card(
        child: ListTile(
          onTap: () => showBottomSheet(_allData[index]['id'] as int),
          onLongPress: () => showBottomSheet(_allData[index]['id'] as int),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 3),
            child: Text(
              _allData[index]['title'],
              style: const TextStyle(fontSize: 20),
            ),
          ),
          subtitle: Text(_allData[index]['desc']),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () => showBottomSheet(_allData[index]['id'] as int),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.yellow,
                ),
              ),
              IconButton(
                onPressed: () => _deleteData(_allData[index]['id'] as int),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
