import 'dart:convert';

import 'package:creator/creator.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:usa_spending/src/api/spending_service.dart';
import 'package:usa_spending/src/api/state_overview_model.dart';

///Class IsarCache

///Opens Isar cache
Creator<Future<Isar>> cacheCreator = Creator(
  (ref) async {
    final dir = await getApplicationDocumentsDirectory();

    return Isar.open(
      [StateOverviewModelSchema],
      directory: dir.path,
      name: 'StateOverviewCache',
    );
  },
  name: 'cacheCreator',
);

//Please check whether the instance is already open
//using Isar.getInstance("yourInstanceName")

///add data to Isar cache from web
Creator<Future<void>> addToCacheCreator = Creator(
  (ref) async {
    final isar = Isar.getInstance('StateOverviewCache');

    final rawData = await ref.watch(stateOverviewCreator);
    final jsonList = jsonDecode(rawData) as List<dynamic>;
    final modelList = <StateOverviewModel>[];
    for (final dynamic item in jsonList) {
      final convertedItem =
          StateOverviewModel.fromJson(item as Map<String, dynamic>);
      modelList.add(convertedItem);
    }
    await isar!.writeTxn(() async {
      await isar.stateOverviewModels.putAll(modelList);
    });
  },
  name: 'addToCacheCreator',
);

///read data from Isar cache
Creator<Future<List<StateOverviewModel>>> readCacheCreator = Creator(
  (ref) async {
    var isar = Isar.getInstance('StateOverviewCache');

    if (isar == null || isar.name == 'Isar') {
      isar = await ref.read(cacheCreator);
    }

    final cacheLength = await isar!.stateOverviewModels.count();

    if (cacheLength == 0) {
      await ref.read(addToCacheCreator);
    }

    final data = await isar.stateOverviewModels.where().findAll();
    return data;
  },
  name: 'readCacheCreator',
);
