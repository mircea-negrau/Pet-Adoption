enum Months {
  Jan,
  Feb,
  Mar,
  Apr,
  May,
  Jun,
  Jul,
  Aug,
  Sep,
  Oct,
  Nov,
  Dec,
}

class CustomDateTime {
  String getCurrentDate() {
    final DateTime now = DateTime.now();
    final String month = Months.values[now.month - 1].toString().split(".")[1];
    final String formatted = "${now.day} $month, ${now.year}";
    return formatted;
  }
}
