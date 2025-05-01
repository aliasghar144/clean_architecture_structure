
import '../../domain/repository/{{name.pascalCase()}}_repository.dart';
import '../data_source/{{name.pascalCase()}}_api.dart';


class {{name.pascalCase()}}RepositoryImpl extends {{name.pascalCase()}}Repository {
    {{name.pascalCase()}}Api {{name.snakeCase()}}Api;
    {{name.pascalCase()}}RepositoryImpl(this.{{name.snakeCase()}}Api);


  // @override
  // Future<Either<ErrorModel, CheckAppEntity>> login() async {
  //   return await safeApiCall(() async {
  //     Response response = await splashApi.login();
  //     return loginModel.fromJson(response.data);
  //   },);
  // }

}
