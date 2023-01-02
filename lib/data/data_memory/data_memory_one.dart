import '../../models/tile_model_one.dart';

List<TileModel> pairs = [];
List<TileModel> pairsYellow = [];
List<TileModel> pairsWhite = [];
List<TileModel> visiblePairs = [];
bool selected = false;

// Lưu trữ Images đã chọn
String selectedImageAssetPath = '';
int selectedTileIndex = 0;

// Số vòng chơi Round
int tries = 0;

// int numOfY = 0;
// int numOfW = 0;
int total = 0;

int score = 0;

int numOfChoose = 0;
// int numOfCorrect = 0;
int numOfWrong = 0;
int level = 1;
int maxLevel = 0;

// Pick Img random
List<T> pickRandomItemsAsListWithSubList<T>(List<T> items, int count) =>
    (items.toList()..shuffle()).sublist(0, count);

// 101
List<TileModel> getWhite() {
  List<TileModel> pairs2 = [
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/white.png",
      isSelected: false,
    ),
  ];
  return pairs2;
}

// 102
List<TileModel> getYellow() {
  List<TileModel> pairs2 = [
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
    TileModel(
      imageAssetPath: "assets/yellow.png",
      isSelected: false,
    ),
  ];
  return pairs2;
}
