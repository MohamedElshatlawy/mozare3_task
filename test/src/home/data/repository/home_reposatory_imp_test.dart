import 'package:Mozare3_demo/core/util/network/network_info.dart';
import 'package:Mozare3_demo/src/home/data/datasources/home_remote_data_source.dart';
import 'package:Mozare3_demo/src/home/data/repository/home_reposatory_imp.dart';
import 'package:Mozare3_demo/src/home/domain/repository/home_reposatory.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'home_reposatory_imp_test.mocks.dart';

@GenerateMocks([NetworkInfo, HomeRemoteDataSource])
void main() {
  late HomeRemoteDataSource homeRemoteDataSource;
  late NetworkInfo mockNetworkInfo;
  late HomeRepository homeRepository;

  setUp(() {
    homeRemoteDataSource =
        MockHomeRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    homeRepository = HomeRepositoryImp(
      dataSource: homeRemoteDataSource,
      networkInfo: mockNetworkInfo
    );


  group(
      "Test Home Repository internet connection",
      () {
    test('Return internet connection  connected (true)', () async {
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      final result = await mockNetworkInfo.isConnected;
      expect(result, true);
    });
    test('Get home products\'s data  repository', () async {
      
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(true));
      when(mockNetworkInfo.isConnected).thenAnswer((_) => Future.value(false));
      when(homeRemoteDataSource.getProducts(
       pageNumber: 1,
       pageSize: 10
      ));
      try {
        await homeRepository.getProducts(
        pageNumber: 1,
        pageSize: 10
        );
        verify(await homeRepository.getProducts(
        pageNumber: 1,
        pageSize: 10
        ));
      } catch (e) {
        throwsA(UnimplementedError("No Internet Connection"));
      }
    });
  
  });
  });
}