import 'package:first_app/mvvm/interfaces/mvvm_api.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class MockClent extends Mock implements http.Client {}
class MockApiService extends Mock implements MVVMApi {}