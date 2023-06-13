class ApiConstants {
  static String baseUrl = 'photonismapi-production.up.railway.app';

  static String postsEndpoint = "post";
  static String postEndpoint = "post/feed";
  static String popularEndpoint = "post/popular";
  static String postIdEndPoint(String id) {
    return "post/feed/$id";
  }

  static String loginEndpoint = "auth/login";
  static String registerEndpoint = "auth/register";

  static String likeDislike(String id) => 'post/likeDislike/$id';

  static String profileEndPoint(String id) {
    return "user/profile/$id";
  }

  static String userEndPoint(String id) {
    return "user/$id";
  }
}
