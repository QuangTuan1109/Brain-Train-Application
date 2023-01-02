import '../../models/tile_model_one.dart';

bool selected = false;
List<TileModel> pairs = [];

List<TileModel> quest = [];
List<TileModel> visiblePairs = [];

List<TileModel> roundPairs = [];
List<TileModel> remain = [];

List<String> exist = [];

// int index = 0;
List<int> index = [];
var contain;

int levels = 1; // Lượt chơi
int card = 0;
int score = 0;
int numOfCard = 0;
int responseTime = 0;
double argTime = 0;
double bonusScore = 0;
double totalScore = 0;

// String selectedImageAssetPath = "";
List<String> selectedImageAssetPath = [];

// Pick Img random
List<T> pickRandomItemsAsListWithSubList<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).sublist(0, count);

var listOfList = [getPairs(), getPairs_2(), getPairs_3(), getPairs_4()];

List<TileModel> getPairs() {
  List<TileModel> pairs = [
    TileModel(imageAssetPath: 'assets/Animal/doi.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/cuu.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/cavoi.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/bachtuot.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/trau.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/ran.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/chuot.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/vit.png', isSelected: false),
    //////////////////
    TileModel(imageAssetPath: 'assets/Animal/9.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/10.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/11.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/12.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/13.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/14.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/15.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/16.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/17.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/18.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/19.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/20.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/21.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/22.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/23.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/24.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/25.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/26.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/27.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/28.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/29.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/30.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/31.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/32.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/33.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/34.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/35.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/36.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/37.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/38.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/39.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/40.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/41.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/42.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/43.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/44.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/45.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/46.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/47.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/48.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/49.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Animal/50.jpg', isSelected: false),
  ];
  return pairs;
}

List<TileModel> getPairs_2() {
  List<TileModel> pairs = [
    TileModel(imageAssetPath: 'assets/Fruit/1.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/2.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/3.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/4.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/5.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/6.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/7.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/8.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/9.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/10.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/11.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/12.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/13.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/14.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/15.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/16.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/17.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/18.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/19.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/20.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/21.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/22.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/23.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/24.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/25.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/26.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/27.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/28.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/29.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/30.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/31.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/32.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/33.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/34.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/35.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/36.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/37.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/38.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/39.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/40.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/41.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/42.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/43.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/44.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/45.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/46.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/47.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/48.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/49.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Fruit/50.jpg', isSelected: false),
  ];
  return pairs;
}

List<TileModel> getPairs_3() {
  List<TileModel> pairs = [
    TileModel(imageAssetPath: 'assets/Household/1.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/2.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/3.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/4.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/5.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/6.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/7.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/8.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/9.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/10.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/11.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/12.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/13.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/14.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/15.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/16.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/17.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/18.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/19.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/20.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/21.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/22.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/23.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/24.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/25.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/26.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/27.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/28.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/29.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/30.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/31.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/32.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/33.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/34.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/35.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/36.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/37.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/38.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/39.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/40.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/41.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/42.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/43.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/44.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/45.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/46.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/47.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/48.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/49.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Household/50.jpg', isSelected: false),
  ];
  return pairs;
}

List<TileModel> getPairs_4() {
  List<TileModel> pairs = [
    TileModel(imageAssetPath: 'assets/Transportation/1.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/2.png', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/3.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/4.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/5.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/6.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/7.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/8.jpg', isSelected: false),
    TileModel(imageAssetPath: 'assets/Transportation/9.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/10.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/11.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/12.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/13.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/14.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/15.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/16.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/17.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/18.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/19.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/20.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/21.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/22.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/23.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/24.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/25.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/26.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/27.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/28.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/29.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/30.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/31.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/32.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/33.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/34.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/35.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/36.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/37.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/38.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/39.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/40.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/41.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/42.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/43.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/44.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/45.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/46.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/47.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/48.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/49.jpg', isSelected: false),
    TileModel(
        imageAssetPath: 'assets/Transportation/50.jpg', isSelected: false),
  ];
  return pairs;
}

List<TileModel> getQuestion() {
  List<TileModel> pairs = [
    // 1
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: 'assets/Animal/question.png',
      isSelected: false,
    ),
  ];

  return pairs;
}
