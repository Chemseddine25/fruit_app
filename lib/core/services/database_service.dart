abstract class DatabaseService {
  Future<void> addData(String path, Map<String, dynamic> data);
  Future<Map<String, dynamic>> getData(String path, String id);
}
