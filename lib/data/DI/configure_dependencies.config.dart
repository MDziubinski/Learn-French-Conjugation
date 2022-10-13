// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain/conjugation/repository/conjugation_respository.dart'
    as _i4;
import '../../presentation/conjugation/cubit/conjugation_cubit.dart' as _i7;
import '../../presentation/use_case/get_conjugation_use_case.dart' as _i6;
import '../conjugation/mappers/verb_dto_to_verb_mapper.dart' as _i3;
import '../conjugation/repository/conjugation_repository_impl.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.VerbDtoToVerbMapper>(() => _i3.VerbDtoToVerbMapper());
  gh.lazySingleton<_i4.ConjugationRepository>(
      () => _i5.ProductListRepositoryImpl(get<_i3.VerbDtoToVerbMapper>()));
  gh.factory<_i6.GetConjugationUseCase>(
      () => _i6.GetConjugationUseCase(get<_i4.ConjugationRepository>()));
  gh.factory<_i7.ConjugationCubit>(
      () => _i7.ConjugationCubit(get<_i6.GetConjugationUseCase>()));
  return get;
}
