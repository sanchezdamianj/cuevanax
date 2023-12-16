import 'package:cuevanax/infrastructure/repositories/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cuevanax/infrastructure/datasources/isar_datasource.dart';

final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource(),
      datasource: IsarDatasource());
});
