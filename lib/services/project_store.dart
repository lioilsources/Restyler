import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

import '../models/booth_project.dart';

abstract interface class ProjectStore {
  List<BoothProject> all();
  Future<void> save(BoothProject project);
  Future<void> delete(String id);
}

/// JSON strings in one box: no generated adapters to keep in step with the
/// model. Masks travel inside the plan, kB each.
class HiveProjectStore implements ProjectStore {
  HiveProjectStore(this._box);

  static const boxName = 'booth_projects';

  static Future<HiveProjectStore> open() async =>
      HiveProjectStore(await Hive.openBox<String>(boxName));

  final Box<String> _box;

  @override
  List<BoothProject> all() => [
    for (final raw in _box.values)
      BoothProject.fromJson(jsonDecode(raw) as Map<String, dynamic>),
  ]..sort((a, b) => b.createdAt.compareTo(a.createdAt));

  @override
  Future<void> save(BoothProject project) =>
      _box.put(project.id, jsonEncode(project.toJson()));

  @override
  Future<void> delete(String id) => _box.delete(id);
}
