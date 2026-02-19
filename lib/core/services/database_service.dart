abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<dynamic> getData(
      {required String path, String? id, Map<String, dynamic>? filter});
}
