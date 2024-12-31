import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:my_quran/common/failure.dart';
import 'package:my_quran/domain/entities/doa/doa_data.dart';
import 'package:my_quran/domain/repositories/doa/doa_repository.dart';

@lazySingleton
class GetListDoaUsecase {
  final DoaRepository doaRepository;

  GetListDoaUsecase({required this.doaRepository});

  Future<Either<Failure, List<DoaData>>> call() {
    return doaRepository.getListDoa();
  }
}
