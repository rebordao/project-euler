# Project Euler Solutions

## Description

This repository has solutions to some problems of Project Euler.

We sorted the problems by their number of solutions and started
solving some of them in R, Python, Julia and Scala.

## Strategy

We value simplicity, memory efficiency, speed optimization, and - as much 
as possible - using only built-in functions.

R doesn’t support large integers and for this we had to use the package `gmp`.

# Utilities

- `build_headers.R` creates files for the intended language with headers that
contain information about the problem (problem number, title, url and description).
There are two user-defined arguments:
    - problem number range (ex: 51:53 for R creates files p51.R, p52.R and p53.R)
    - language (R, Python, Julia, Scala).
- `sorts_problems.R` sorts problems by their number of solutions; in descending
order. This is useful to see that people don't work in these problems sequentially.

## Authors

- [Antonio Rebordao](https://www.linkedin.com/in/rebordao) (
R and Julia solutions; Mathematical Optimization)
- [Charalampos Papaloizou](https://github.com/papaloizouc) (
Python solutions)
- [Adriano Vinhas](https://github.com/avinhas) (Scala solutions)