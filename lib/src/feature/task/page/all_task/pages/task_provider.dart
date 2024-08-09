import 'package:intl/intl.dart';

abstract class TaskFunctions {
  //toShortName example from  Ali Kairatov Zhalel to Ali K.Z.
  static String toShortName(String name) {
    if (name.isNotEmpty) {
      List<String> splitedName = name.split(' ');
      String shortName =
          "${splitedName[0]} ${splitedName[1][0]}.${splitedName[2][0]}.";
      return shortName;
    }
    return '';
  }

//to date
  static String toDate(String date) {
    DateTime time = DateTime.parse(date);
    DateFormat dataFormate = DateFormat('HH:mm dd.MM');
    String result = dataFormate.format(time).toString();
    return result;
  }

//to remove data:image/png;base64,
  static String base64ToImage(String base64String) {
    const String prefix = 'data:image/png;base64,';
    if (base64String.startsWith(prefix)) {
      return base64String.substring(prefix.length);
    }
    return base64String; 
  }

//toCulutre from num to word
  static String toCulture(String culture) {
    int id = int.parse(culture);
    if (id == -1) {
      return 'не указан';
    } else if (id == 1) {
      return 'Сорго';
    } else if (id == 2) {
      return 'Пшеница';
    } else if (id == 3) {
      return 'Сахарная свекла';
    } else if (id == 4) {
      return 'Кукуруза';
    } else if (id == 5) {
      return 'Подсолнечник';
    } else if (id == 6) {
      return 'Соя';
    } else if (id == 7) {
      return 'Ячмень';
    } else if (id == 8) {
      return 'Горох';
    } else if (id == 9) {
      return 'Рапс';
    } else if (id == 10) {
      return 'Кориандр';
    } else if (id == 11) {
      return 'Люцерна';
    } else if (id == 12) {
      return 'Вика';
    } else if (id == 13) {
      return 'Овёс';
    } else if (id == 14) {
      return 'Клевер';
    } else if (id == 15) {
      return 'Гречиха';
    } else if (id == 16) {
      return 'Просо';
    } else if (id == 17) {
      return 'Лён';
    } else if (id == 18) {
      return 'Клубника';
    } else if (id == 19) {
      return 'Малина';
    } else if (id == 20) {
      return 'Смородина';
    } else if (id == 21) {
      return 'Голубика';
    } else if (id == 22) {
      return 'Клюква';
    } else if (id == 23) {
      return 'Черника';
    } else if (id == 24) {
      return 'Ежевика';
    } else if (id == 25) {
      return 'Рожь';
    } else if (id == 26) {
      return 'Картофель';
    } else if (id == 27) {
      return 'Нут';
    } else if (id == 28) {
      return 'Чечевица';
    } else if (id == 29) {
      return 'Чеснок';
    } else if (id == 30) {
      return 'Конопля';
    } else if (id == 31) {
      return 'Горчица';
    } else if (id == 32) {
      return 'Морковь';
    } else if (id == 33) {
      return 'Орех';
    } else if (id == 34) {
      return 'Вишня';
    } else if (id == 35) {
      return 'Пар';
    } else if (id == 36) {
      return 'Фестулолиум';
    } else if (id == 37) {
      return 'Пырей';
    } else if (id == 38) {
      return 'Тыква';
    } else if (id == 39) {
      return 'Виноград';
    } else if (id == 40) {
      return 'Фасоль';
    } else if (id == 41) {
      return 'Тритикале';
    } else if (id == 42) {
      return 'Люпин';
    } else if (id == 43) {
      return 'Зерносмесь';
    } else if (id == 44) {
      return 'Абрикос';
    } else if (id == 45) {
      return 'Персик';
    } else if (id == 46) {
      return 'Айва';
    } else if (id == 47) {
      return 'Слива';
    } else if (id == 48) {
      return 'Черешня';
    } else if (id == 49) {
      return 'Яблоко';
    } else if (id == 50) {
      return 'Томат';
    } else if (id == 51) {
      return 'Шафран';
    } else if (id == 52) {
      return 'Дыня';
    } else if (id == 53) {
      return 'Арбуз';
    } else if (id == 54) {
      return 'Капуста';
    } else if (id == 55) {
      return 'Полевые травы';
    } else if (id == 56) {
      return 'Редис';
    } else if (id == 57) {
      return 'Твёрдая пшеница';
    } else if (id == 58) {
      return 'Красная чечевица';
    } else if (id == 59) {
      return 'Однолетние травы';
    } else if (id == 60) {
      return 'Красное сорго';
    } else if (id == 61) {
      return 'Хорасан';
    } else if (id == 62) {
      return 'Бромус';
    } else if (id == 63) {
      return 'Сурепица';
    } else if (id == 64) {
      return 'Фацелия';
    } else if (id == 65) {
      return 'Амарант';
    } else if (id == 66) {
      return 'Суданская трава';
    } else {
      return 'неизвестно';
    }
  }
}
