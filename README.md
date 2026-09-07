# Advent of Zydeco

Advent of code solutions in
[Zydeco](https://github.com/zydeco-lang/zydeco), an experimental
language based on call-by-push-value.

## Layout

```
lib/builtin.zy   the compiler's host contract, re-exported for the solutions
lib/aoc.zy       the standard library plus line-oriented I/O helpers
2022/NN/         one directory per day: solutions, `sample`, and `input`
2023/01/
test.sh          runs every solution and compares with the known answers
```

A day with separate files for the two parts (`01a.zy`, `01b.zy`) prints one
answer; a day with a single file (`05.zy`, `06.zy`) prints both, part a first.

## Running

The solutions import the standard library from a checkout of the Zydeco
compiler that must sit next to this repository as `../impl`.  Build it with
`cargo build --release` there, then:

```sh
../impl/target/release/zydeco run 2022/01/01a.zy < 2022/01/input
./test.sh                      # all solutions, samples and inputs
ZYDECO=zydeco ./test.sh        # with a compiler on your PATH
```

Each solution reads the puzzle input from standard input.
