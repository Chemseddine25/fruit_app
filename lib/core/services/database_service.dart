abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<dynamic> getData(
      {required String path,
      String? id,
      String? queryName,
      String columns,
      Map<String, dynamic>? filter});

  Future<void> deleteData(String path, String id);
  Future<void> updateData(String path, String id, Map<String, dynamic> data);
}
