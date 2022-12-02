import 'dart:io';

Future<String> readFile(String path) async {
  var file = File(path);
  return file.readAsString();
}

/// input:
/// 10505
/// 4718
///
/// 16579
/// 11333
///
/// 15453
/// 15172
/// 2678
/// 9202
/// 12549
///
/// 2133
/// 16769
/// 6807
/// 10384
///
/// output:
/// [
///  [10505, 4718],
///  [16579, 11333],
///  [15453, 15172, 2678, 9202, 12549],
///  [2133, 16769, 6807, 10384]
/// ]
List<List<int>> parseDblListInts(String st) {
  final topLists = st.split('\n\n');

  final babyLists = topLists
      .map(
        (e) => e.split('\n').map<int>(int.parse).toList(),
      )
      .toList();

  return babyLists;
}
