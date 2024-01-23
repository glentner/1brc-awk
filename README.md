1brc-awk
========

Solution(s) to [1BRC](https://1brc.dev) in _Awk_.

The naive solution (single-threaded) in many common languages are very slow.
I wanted to see how a pure Awk solution would compare.

All of my tests were run on
a high-performance server (Two AMD Epyc 7763 “Milan” CPUs @ 2.2GHz) on top of
a high-performance Lustre file system (100 Gbps HDR Infiniband interconnect).

I can stream `measurements.txt` in ~2 seconds.
All decent multi-threaded solutions run in ~5-10 seconds.

I haven't included them here because I'm comparing the typical naive approach
you would expect out of any of these without any special tricks or parallelism.

* CPython in ~12 minutes
* Java, Kotlin, Awk in ~10 minutes
* C++, Rust in ~7 minutes

If comparing the _purest_, _naive_ approach, Awk seems to win out, with
the simplest expression of logic. However, it is still horrendously slow
compared to any multi-threaded approach or modest optimization in any other
language.

Attempts to use something like `split` and/or `parallel --pipe` allow
for multiple parallel Awk jobs with a combine phase at the end.

The trival SQL implementation executed with DuckDB finishes in ~3 seconds.
Written in C++, automatically parallel. A quality multi-threaded solution
written in Rust finishes in ~5 seconds.

This was fun to see how it would compare.

