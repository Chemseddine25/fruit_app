import 'package:fruit_app/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseDatabase extends DatabaseService {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await _client.from(path).insert(data);
  }

  @override
  Future<dynamic> getData(
      {required String path,
      //Map<String, dynamic>? query,
      String? id,
      String? queryName,
      String columns = '*',
      Map<String, dynamic>? filter}) async {
    dynamic data = _client.from(path).select(columns);

    if (id != null && queryName != null) {
      data = data.eq(queryName, id);

      return data;
    }

    //final data = await _client.from(path).select().eq('uId', id).single();
    //return data;

    if (filter != null) {
      if (filter["orderby"] != null) {
        var orderby = filter["orderby"];
        var descending = filter["descending"];
        data = data.order(orderby, ascending: !(descending ?? false));
      }
      if (filter["limit"] != null) {
        var limit = filter["limit"];
        data = data.limit(limit);
      }
    }

    var result = await data;
    return result;
  }

  @override
  Future<void> deleteData(String path, String id) async {
    await _client.from(path).delete().eq('id', id);
  }

  @override
  Future<void> updateData(
      String path, String id, Map<String, dynamic> data) async {
    await _client.from(path).update(data).eq('id', id);
  }
}
