import 'package:unimed/app/data/enums/case_type.enum.dart';
import 'package:unimed/app/data/services/data_health.service.dart';

class DataHealthRepository {
  final DataHealthApiService api = DataHealthApiService();

  getCasesDengue({required int year, int? limitCases}) {
    return api.getCases(
        typeRef: CaseTypeRefEnum.dengue, year: year, limit: limitCases);
  }
}
