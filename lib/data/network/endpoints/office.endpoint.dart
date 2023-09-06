import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
import 'package:starter/data/network/dio.client.dart';
import 'package:starter/data/network/responses/quote.response.dart';
import 'package:dio/dio.dart';

part 'office.endpoint.g.dart';

///
@RestApi()
@injectable
abstract class OfficeEndpoint {

  ///
  @factoryMethod
  factory OfficeEndpoint(DioClient dio) {
    return _OfficeEndpoint(dio);
  }

  ///
  @GET('/random')
  Future<QuoteResponse> getQuote();

}
