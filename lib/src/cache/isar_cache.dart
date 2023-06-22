import 'dart:convert';

import 'package:creator/creator.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:usa_spending/src/api/spending_service.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

///Class IsarCache
class IsarCache {
  ///Opens Isar cache
  Future<Isar> cache() async {
    final dir = await getApplicationDocumentsDirectory();
    return Isar.open(
      [StateOverviewModelSchema],
      directory: dir.path,
    );
  }
}

///add data to Isar cache from web
Creator<Future<void>> addToCacheCreator = Creator((ref) async {
  final isar = await IsarCache().cache();
  final rawData = await ref.watch(stateOverviewCreator);
  final jsonList = jsonDecode(rawData) as List<dynamic>;
  final modelList = <StateOverviewModel>[];
  for (final dynamic item in jsonList) {
    final convertedItem =
        StateOverviewModel.fromJson(item as Map<String, dynamic>);
    modelList.add(convertedItem);
  }
  await isar.writeTxn(() async {
    await isar.stateOverviewModels.putAll(modelList);
  });
});

///read data from Isar cache
Creator<Future<List<StateOverviewModel>>> readCacheCreator =
    Creator((ref) async {
  final isar = await IsarCache().cache();
  final cacheLength = await isar.stateOverviewModels.count();
  if (cacheLength == 0) {
    await ref.read(addToCacheCreator);
  }
  final data = await isar.stateOverviewModels.where().findAll();
  return data;
});
