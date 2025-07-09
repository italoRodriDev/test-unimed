import 'package:get/get.dart';
import 'package:unimed/app/data/enums/case_type.enum.dart';

const baseUrl = 'https://apidadosabertos.saude.gov.br';

class DataHealthApiService extends GetConnect {
  Future<Response> getCases(
      {required CaseTypeRefEnum typeRef,
      required int year,
      int? limit = 10,
      int offset = 0}) {
    return get('${baseUrl}/${typeRef.url}', query: {
      'nu_ano': '${year}',
      'limit': '${limit}',
      'offset': '${offset}'
    }, headers: {
      'accept': 'application/json'
    });
  }
}
