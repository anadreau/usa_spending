import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

class IsarCache {
  Future<Isar> cache() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [StateOverviewModelSchema],
      directory: dir.path,
    );
  }
}
