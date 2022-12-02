import 'package:aoc22/utils.dart';

void main() async {
  final inpStr = await readFile('lib/1/inp.txt');
  final elfPayloads = parseDblListInts(inpStr);

  final max = mostPayload(elfPayloads);

  print(max);
}

List<int> mostPayload(List<List<int>> payloads) {
  int maximumIdx = -1, maximumPayload = 0;

  int i = 0;
  for (final payload in payloads) {
    final cP = payload.reduce((e, sum) => e + sum);

    if (cP > maximumPayload) {
      maximumIdx = i;
      maximumPayload = cP;
    }

    i++;
  }

  return [maximumIdx, maximumPayload];
}
