import 'package:aoc22/utils.dart';

// https://adventofcode.com/2022/day/1
void main() async {
  final inpStr = await readFile('lib/1/inp.txt');
  final elfPayloads = parseDblListInts(inpStr);

  // part 1
  final max = mostPayload(elfPayloads);
  print('max carrying elf is the ${max[0]}th elf, with ${max[1]} calories');

  // part 2
  final top3 = top3Payloads(elfPayloads);
  final total = top3.reduce((v, e) => v + e);

  print(
      'top 3 carried calorie amounts are ${top3[0]}, ${top3[1]} and ${top3[2]} with total of $total');
}

List<int> top3Payloads(List<List<int>> payloads) {
  final sorted = sortPayloads(payloads);

  return sorted.take(3).toList();
}

List<int> sortPayloads(List<List<int>> payloads) {
  final totalList = payloads
      .map(
        (el) => el.reduce(
          (v, e) {
            return v + e;
          },
        ),
      )
      .toList();
  totalList.sort(
    (a, b) {
      return b.compareTo(a);
    },
  );
  return totalList;
}

List<int> mostPayload(List<List<int>> payloads) {
  int maximumIdx = -1, maximumPayload = 0;

  int i = 0;
  for (final payload in payloads) {
    final cP = payload.reduce(
      (e, sum) {
        return e + sum;
      },
    );

    if (cP > maximumPayload) {
      maximumIdx = i;
      maximumPayload = cP;
    }

    i++;
  }

  return [
    maximumIdx,
    maximumPayload,
  ];
}
