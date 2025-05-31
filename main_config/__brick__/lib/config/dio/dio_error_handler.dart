



class DioErrorHandler {
  static String handleError(int? errorCode, String slug) {
    switch (errorCode) {
      case 200:
        return 'با موفقیت انجام شد';
      default:
        switch(slug){
          case 'JWT expired':
            return 'توکن منقضی شده';
          default: return slug;
        }
    }
  }

}
