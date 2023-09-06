import 'package:injectable/injectable.dart';
import 'package:starter/data/network/endpoints/office.endpoint.dart';
import 'package:starter/data/network/responses/quote.response.dart';

///
/// Repository example
///
@injectable
class HomeRepository {
  ///
  OfficeEndpoint officeEndpoint;

  ///
  HomeRepository(this.officeEndpoint);

  ///
  Future<QuoteResponse> getQuote() async {
    return officeEndpoint.getQuote();
  }
}
