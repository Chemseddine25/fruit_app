import 'package:fruit_app/core/services/database_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupbaseDatabase extends DatabaseService {
  final SupabaseClient _client = Supabase.instance.client;
  @override
  Future<void> addData(String path, Map<String, dynamic> data) async {
    await _client.from(path).insert(data);
  }
}
