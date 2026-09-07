#!/bin/sh
# Run every solution on its sample and puzzle input and compare the output
# with the known answers.
#
# Usage: ./test.sh
# Set ZYDECO to the compiler binary; it defaults to a release build in the
# sibling checkout of the compiler.
cd "$(dirname "$0")" || exit 1
ZYDECO=${ZYDECO:-../impl/target/release/zydeco}
status=0

check() {
  solution=$1
  input=$2
  shift 2
  expected="$*"
  actual=$("$ZYDECO" run "$solution" < "$input" 2>&1 | tr '\n' ' ' | sed 's/ $//')
  if [ "$actual" = "$expected" ]; then
    echo "ok    $solution < $input: $actual"
  else
    echo "FAIL  $solution < $input: got '$actual', expected '$expected'"
    status=1
  fi
}

check 2022/01/01a.zy 2022/01/sample 24000
check 2022/01/01a.zy 2022/01/input 67633
check 2022/01/01b.zy 2022/01/sample 45000
check 2022/01/01b.zy 2022/01/input 199628
check 2022/02/02a.zy 2022/02/sample 15
check 2022/02/02a.zy 2022/02/input 15572
check 2022/02/02b.zy 2022/02/sample 12
check 2022/02/02b.zy 2022/02/input 16098
check 2022/03/03a.zy 2022/03/sample 157
check 2022/03/03a.zy 2022/03/input 7967
check 2022/03/03b.zy 2022/03/sample 70
check 2022/03/03b.zy 2022/03/input 2716
check 2022/04/04a.zy 2022/04/sample 2
check 2022/04/04a.zy 2022/04/input 471
check 2022/04/04b.zy 2022/04/sample 4
check 2022/04/04b.zy 2022/04/input 888
check 2022/05/05.zy 2022/05/sample CMZ MCD
check 2022/05/05.zy 2022/05/input LJSVLTWQM BRQWDBBJM
check 2022/06/06.zy 2022/06/sample0 7 19
check 2022/06/06.zy 2022/06/sample1 5 23
check 2022/06/06.zy 2022/06/sample2 6 23
check 2022/06/06.zy 2022/06/input 1531 2518
check 2022/07/07.zy 2022/07/sample 23
check 2023/01/01.zy 2023/01/sample 142
check 2023/01/01.zy 2023/01/input 57346

exit $status
