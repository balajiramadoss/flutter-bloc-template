import 'package:retrofit/http.dart';
import 'package:starter/data/network/dio.client.dart';
import 'package:starter/data/network/responses/user.response.dart';
import 'package:dio/dio.dart';


part 'user.endpoint.g.dart';

///
/// [UserEndpoint]
///
@RestApi()
abstract class UserEndpoint {

  ///
  factory UserEndpoint(DioClient dio){
    return _UserEndpoint(dio);
  }

  ///
  @GET('/cringe')
  Future<UserResponse> getUser();

}