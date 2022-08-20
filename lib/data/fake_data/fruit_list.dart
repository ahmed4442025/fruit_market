import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:fruit_market/data/models/user_mode.dart';

import '../models/fruit_model.dart';
import '../models/fruit_type.dart';
import '../models/group_model.dart';

class FruitData {
  static List<GroupModel> groups = [];
  static List<FruitModel> allFruits = [];
  static final List<FruitType> fruitTypes = [
    FruitType(name: 'Vegetables ', isSelected: true),
    FruitType(name: 'Fruits'),
    FruitType(name: 'Dry Fruits'),
  ];

  //-------------------
  static final Random _rng = Random();
  static const String _imgFruitPath = "assets/images/fruit/";
  static const String _imgVegetablePath = "assets/images/vegetable/";
  static UserModel userModel =
      UserModel('manish marten', "manish2056@gmail.com", "assets/images/man.jpg");

  static void init() {
    _initAllFruits();
    _initGroups();
  }

  static void _initGroups() {
    // ---------- Organic Fruits ----------
    groups.add(_getGroupFruit());
    // ---------- Organic Vegetable ----------
    groups.add(_getGroupVegetable());

    for (String name in _groupsNames) {
      groups.add(GroupModel(
          getRandomListFruit(_rng.nextInt(allFruits.length) + 2),
          name,
          _rng.nextInt(10) > 4 ? '(15% Off)' : null,
          'Pick up from organic farms'));
    }
  }

  static void _initAllFruits() {
    List<FruitModel> l = [];
    for (String f in _fruitInfo.keys) {
      l.add(_infoToFruitModel(f, _fruitInfo[f] ?? '', _imgFruitPath));
    }
    for (String f in _vegetableInfo.keys) {
      l.add(_infoToFruitModel(f, _vegetableInfo[f] ?? '', _imgVegetablePath));
    }
    allFruits = l;
  }

  // ========================

  static List<FruitModel> getRandomListFruit(count) {
    List<FruitModel> l = [];
    count = count > allFruits.length ? allFruits.length : count;
    for (int i = 0; i < count; i++) {
      l.add(allFruits[_rng.nextInt(allFruits.length)]);
    }
    return l;
  }

  static GroupModel _getGroupFruit() {
    List<FruitModel> l = [];
    for (String f in _fruitInfo.keys) {
      l.add(_infoToFruitModel(f, _fruitInfo[f] ?? '', _imgFruitPath));
    }
    return GroupModel(
        l, 'Organic Fruits', "(20% Off)", "Pick up from organic farms");
  }

  static GroupModel _getGroupVegetable() {
    List<FruitModel> l = [];
    for (String f in _vegetableInfo.keys) {
      l.add(_infoToFruitModel(f, _vegetableInfo[f] ?? '', _imgVegetablePath));
    }
    return GroupModel(
        l, 'Organic Fruits', "(10% Off)", "Pick up from other organic farms");
  }

  static FruitModel _infoToFruitModel(
      String name, String description, String imgPath) {
    String img = "$imgPath${name.replaceAll(" ", "_")}.jpg";
    double price = (_rng.nextInt(30) + 5).toDouble();
    double rate = (300 + _rng.nextInt(200)).toDouble() / 100;
    bool isFavor = _rng.nextInt(10) > 8;
    List<String> nutrition = _getRandomNutrition(_rng.nextInt(4) + 3);

    return FruitModel(
        name: name,
        nutrition: nutrition,
        isFavorite: isFavor,
        price: price,
        rate: rate,
        details: description,
        img: img);
  }

  static List<String> _getRandomNutrition(int count) {
    List<String> l = [];
    for (int i = 0; i <= count; i++) {
      l.add(_nutrition[_rng.nextInt(_nutrition.length - 1)]);
    }
    return l;
  }

  static const Map<String, String> _fruitInfo = {
    "strawberry":
        "It is a small, low-lying, spreading shrub. It bears small white flowers, which eventually develop into small conical, light green, immature fruits. They turn red upon maturity, with each berry featuring red pulp and tiny, yellow seeds piercing from within through its surface. Its stem end carries a green leafy cap (calyx with peduncle) that is adorning as a crown.",
    "banana":
        "Banana is a perennial herbaceous plant that grows from the underground rhizome. It flourishes well under tropical, moisture-rich, humid, low-lying farmlands.",
    "avocado":
        "Avocado is a medium-sized, evergreen tree that reaches about 20-30 feet in height and features a large, green foliage cover. It prefers fertile soil with high moisture to flourish. Small, light-green flowers appear during winter. In about 8-10 months after bloom, hundreds of pear-shaped green fruits cover the tree.",
    "orange":
        "Delicious and juicy orange fruit contain an impressive list of essential nutrients, vitamins, minerals for healthy growth and development and overall well-being.",
    "limes":
        'Limes are small, round, greenish-yellow, intensely acidic citrus fruits. Lime is primarily used for its juice in the western world, and for preparing "condiment-pickle" in many Southeast Asian countries.',
    "raspberry":
        "Wonderfully delicious, bright red raspberry is among the most popular berries to relish! They are rich sources of health-promoting plant-derived chemicals, minerals, and vitamins that are essential for optimum health.",
    "mango":
        'The king of the fruits, mango fruit is one of the most popular, nutritionally rich fruits with unique flavor, fragrance, taste, and heath promoting qualities, making it numero-uno among new functional foods, often labeled as super fruits.',
    "pomegranate":
        "Pomegranate is one of the most popular, nutritionally rich fruit known for its unique flavor, taste, and heath-promoting characteristics. Together with sub-arctic pigmented berries and some tropical exotics such as mango",
    "cherry":
        "Wonderfully delicious, cherry fruit is packed full of health-benefiting nutrients and unique antioxidants. Cherries are native to Eastern Europe and Asia Minor regions.",
    "apricot":
        'Full of fragrance and sweet, golden-orange apricots are another summer delicacies of Asian origin. These much-prized fruits were first brought to Europe by Greeks, who named them as “golden eggs of the sun."',
  };

  static const Map<String, String> _vegetableInfo = {
    "Carrots":
        "Naturally sugary, delicious, and crunchy, carrots are healthy additions you can make to the vegetable list of your diet. Indeed, these root vegetables come with wholesome health benefiting compounds such as beta-carotenes, falcarinol, vitamin-A, minerals, and anti-oxidants in ample amounts.",
    "Collard greens":
        "Collard greens are highly nutritious, “cabbage-like flavored” leafy green vegetables. Collards are one of the most popular members of the Brassica family, closely related to kale and cabbage and could be described as a non-heading (acephalous) cabbage.",
    "Bell pepper":
        "Bell pepper, also known as sweet pepper, is one of the most commonly employed chili peppers in the Capsicum annuum family. Sweet peppers are fruit pods on the capsicum plant grown for their subtle hotness yet sweet, the delicate peppery flavor they extend to the recipes.",
    "Turnips":
        "Turnips are popular, nutritious root vegetables. They are round, tuberous roots grown in many parts of Europe, and Asia as one of the cool-season vegetables.",
    "Zucchini":
        "Zucchini squash (courgette) is one of the most popular summer squashes in Americas and Europe. Like in other gourd vegetables, it also belongs in the Cucurbitaceae (Cucurbita-pepo) family of vegetables.",
    "Sweet corn":
        "Sweet corn is a specialty maize species that differ genetically from the field maize. Its kernels are tender, delicious, and eaten as a vegetable in many cuisines worldwide. In contrast to the traditional field corn",
    "Rhubarb":
        "Rhubarb is a perennial herb grown for its attractingly succulent, rose red, edible leafy stalks. This cool-season plant is native to Siberia and widespread in many regions of Europe and North America as a “pie plant.” In its natural habitat, the plant expands over the ground surface as a large spread.",
    "Onion":
        "Onion is one of the oldest edible food ingredients known to humankind used in a bewildering array of recipes and preparations, be it your favorite salad or a mouth-watering gravy or curries! It has also been employed in traditional medicines since ancient times for its health-promoting and curative properties.",
    "Potato":
        "Potato is a starchy root vegetable of Central American origin. This humble tuber is one of the most widely grown root crops and one of the cheapest staple food ingredients consumed all over the world.",
    "Pumpkin":
        "Pumpkin fruit is one of the widely grown vegetables incredibly rich in vital antioxidants and vitamins. Though this humble backyard vegetable is low in calories, nonetheless it packed with vitamin-A, and flavonoid polyphenolic antioxidants such as lutein, xanthin, and carotenes in abundance.",
    "Cauliflower":
        "Cauliflower (cabbage flower) is one of the familiar winter season vegetables. These beautiful flower heads are brimming with essential nutrients, hold numerous health-benefiting phytonutrients such as vitamins, indole-3-carbinol, and sulforaphane that help prevent overweight, diabetes and offer protection from prostate, ovarian, and cervical cancers.",
  };

  static const List<String> _nutrition = [
    "Potassium",
    "Sodium",
    "Carb",
    "Sugars",
    "Protein",
    "Vitamin (A)",
    "Vitamin (c)",
    "Vitamin (d)",
    "Calcium",
    "Iron",
    "Phosphorous",
    "Magnesium"
  ];

  static const List<String> _groupsNames = [
    'Mixed Fruit Pack',
    'Stone Fruits',
    'group 4',
    'group 5',
    'group 6',
  ];
}
