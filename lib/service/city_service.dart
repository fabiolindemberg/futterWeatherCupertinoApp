
import 'package:http/http.dart' as http;

class BaseService {

  String apiId = "&appid=1d726a51648dc040bd47dca5af0370a3";
  String baseURL = "http://api.openweathermap.org/data/2.5";

  String fromURL(String endpoint) {
    return "$baseURL$endpoint$apiId";
  }
}

abstract class CityService {
  Future<http.Response>  fetchAllCities();
  Future<http.Response>  fetchBy(double latitude, double longitude);
}

class CityServiceImpl extends BaseService implements CityService {
  String lat = "-8.136133";
  String lon = "-37.930044";
  
  @override
  Future<http.Response> fetchAllCities() {
    return http.get(fromURL("/find?lat=$lat&lon=$lon&cnt=40"));
  }

  @override
  Future<http.Response> fetchBy(double latitude, double longitude) {
    String lat = latitude.toString();
    String lon = longitude.toString();

    return http.get(fromURL("/find?lat=$lat&lon=$lon&cnt=40"));;
  }
}

