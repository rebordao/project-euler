# Project Euler Solutions

## Description

This repository has solutions to some problems of Project Euler.

Problems are sorted by their number of solutions and are made predominantly in R but also in Python, Julia and Scala.

## Strategy

Simplicity, memory efficiency, speed optimization are favoured and - as much 
as possible - only built-in functions are used.

R doesn’t support large integers and for this I had to use the package `gmp`.

# Utilities

- `build_headers.R` creates files for the intended language with headers that
contain information about the problem (problem number, title, url and description).
There are two user-defined arguments:
    - problem number range (ex: 51:53 for R creates files p51.R, p52.R and p53.R)
    - language (R, Python, Julia, Scala).
- `sorts_problems.R` sorts problems by their number of solutions; in descending
order. This is useful to see that people don't work in these problems sequentially.
