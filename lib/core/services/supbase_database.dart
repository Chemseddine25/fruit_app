import 'package:fruit_app/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseDatabase extends DatabaseService {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await _client.from(path).insert(data);
  }

  @override
  Future<Map<String, dynamic>> getData(String path, String id) async {
    final data = await _client.from(path).select().eq('uId', id).single();
    return data;
  }
}
