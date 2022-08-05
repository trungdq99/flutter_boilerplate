class NetworkConsts {
  static const int apiTimeout = 10000;

  // all api list
  static final Map<APIType, API> apiList = {
    APIType.omdb: API('http://www.omdbapi.com', '860ea9f0')
  };

  // endpoints
  static final EndPoints endPoints = EndPoints();
}

class EndPoints {
  String get _omdbBaseURL {
    API? api = NetworkConsts.apiList[APIType.omdb];
    return "${api?.url}/?apikey=${api?.apiKey}";
  }

  String omdbGetByTitle(String title) => '$_omdbBaseURL&t=$title';
  String omdbGetByImdbID(String imdbID) => '$_omdbBaseURL&i=$imdbID';
  String omdbSearchTitle(String title) => '$_omdbBaseURL&s=$title';
}

enum APIType { omdb }

class API {
  final String url;
  final String apiKey;

  API(this.url, this.apiKey);
}
