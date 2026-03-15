# Whirlwind

A collection of complete OCaml exercise solutions for a Functional Programming course.

## Overview

This repository contains fully-worked solutions to exercise sheets (fichas) from a Functional Programming course. Each file is a complete, executable OCaml program that covers all problems from its corresponding exercise sheet.

## What's Included

- **ficha1.ml** - Exercise sheet 1: Types, evaluation, and errors
  - 436 lines of code with integrated tests
  - 12 sections covering type inference, error analysis, recursion, and more
  - Compiles and runs without warnings
  - Produces 291 lines of formatted output

- **ficha2.ml, ficha3.ml, etc.** - Additional exercise sheets (planned)

## Running the Code

### Requirements
- OCaml 4.14 or later
- Standard Unix/Linux/Mac/Windows system

### Quick Start
```bash
# Run directly with the OCaml interpreter
ocaml ficha1.ml

# Or compile first for faster execution
ocamlc -o ficha1 ficha1.ml
./ficha1
```

## Structure

Each file follows this format:

```ocaml
(* Section headers *)
let () = Printf.printf "SECÇÃO N: ...\n"

(* Problem statement as comment *)
(* Type annotation *)
let function_definition = ...

(* Test cases with output *)
let () = Printf.printf "Result: %d\n" test_value
```

The files are self-contained and can be run immediately without any external dependencies.

## Content Coverage

**ficha1.ml** covers:
1. Type inference for expressions
2. Evaluation errors and corrections
3. Basic functions 
4. Recursive functions
5. Binary conversion functions
6. Error analysis with fixes
7. More evaluation errors
8. Multiple choice type problems
9. String operations and type safety
10. Tuple manipulation
11. Function calling patterns
12. Static and dynamic environments

**ficha2.ml** covers:

1. Double function
2. Maximum of two numbers
3. Factorial
4. Sum of even numbers
5. Sum of digits
6. Power function (non-terminal)
7. Mystery function (multiplication)
8. Reverse digits (accumulator)
9. Count digits (accumulator)
10. Fibonacci (terminal and non-terminal)
11. Prime number checker

## Educational Use

These files are intended for:
- Understanding functional programming concepts
- Studying OCaml syntax and semantics
- Learning type inference and error handling
- Reference material for similar exercises

For academic purposes

