import 'package:Mozare3_demo/src/home/data/models/Product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  var expectedResult = {
    "internalName": "NICKELODEONALLSTARBRAWL2",
    "title": "Nickelodeon All-Star Brawl 2",
    "metacriticLink": "/game/nickelodeon-all-star-brawl-2/",
    "dealID": "vic9TNgurURo%2FNyXD9RJg9gWFnSm%2FAKuoo08O%2B3q5NE%3D",
    "storeID": "3",
    "gameID": "278103",
    "salePrice": "29.99",
    "normalPrice": "49.99",
    "isOnSale": "1",
    "savings": "40.008002",
    "metacriticScore": "73",
    "steamRatingText": "Very Positive",
    "steamRatingPercent": "84",
    "steamRatingCount": "526",
    "steamAppID": "2017080",
    "releaseDate": 1699315200,
    "lastChange": 1700650468,
    "dealRating": "10.0",
    "thumb":
        "https://cdn.cloudflare.steamstatic.com/steam/apps/2017080/capsule_sm_120.jpg?t=1700669221"
  };
  test("Product model fromJson", () {
    final result = ProductModel.fromJson(expectedResult);
    expect(result, isA<ProductModel>());
  });
}
