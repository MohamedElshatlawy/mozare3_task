import 'package:Mozare3_demo/core/util/network_service.dart';
import 'package:Mozare3_demo/src/home/data/datasources/home_remote_data_source.dart';
import 'package:Mozare3_demo/src/home/data/models/product_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';


import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([NetworkService])
void main() {
  late HomeRemoteDataSourceImpl remoteDataSource;
  late NetworkService mockNetworkService;

  setUp(() {
    mockNetworkService = MockNetworkService();
    remoteDataSource = HomeRemoteDataSourceImpl(mockNetworkService);
  });

  test('Home data source', () async {
    const accountId = '';

    const url = "api/1.0/deals";
    Map<String, dynamic> queryParams = {
      "pageNumber": 1,
      "pageSize": 10,
    };

    when(mockNetworkService.get(url,
            queryParams: queryParams, headers: anyNamed('headers')))
        .thenAnswer(
      (_) async => Response(
          requestOptions: RequestOptions(
            path: url,
          ),
          data: 
            {
              "internalName": "",
              "title": "",
              "salePrice": "",
              "normalPrice": "",
              "steamRatingCount": "",
              "thumb": "",
              "isFav": 1,
              "qty": 1
            }
          ),
    );

    expect(await remoteDataSource.getProducts(pageNumber: 1, pageSize: 10),
        isA<ProductModel>());
  });
}
