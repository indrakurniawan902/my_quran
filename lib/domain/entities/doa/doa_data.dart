// class ListDoaData {
//   final List<DoaData> data;

//   ListDoaData({required this.data});
// }

class DoaData {
  final String id;
  final String judul;
  final String latin;
  final String arab;
  final String terjemah;

  DoaData(
      {required this.id,
      required this.judul,
      required this.latin,
      required this.arab,
      required this.terjemah});
}
