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
      {required String path, String? id, Map<String, dynamic>? filter}) async {
    if (id != null) {
      final data = await _client.from(path).select().eq('uId', id).single();
      return data;
    } else {
      dynamic data = _client.from(path).select();

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
  }
}
