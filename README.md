
# JOLLY
Jolly is a Toy Language.

## General Plans
1) Make the interpreter in OCaml (via Menhir and OCamllex).
2) Convert to some Intermediate Representation (LLVM, probably).
3) Compile/Transpile the code into ??? with standard/graphics libraries. 
4) Compile CUDA code with LLVM? -> NVCC.

## Purpose
Desmos is a humble graphing calculator that I have long used to prototype mathematical ideas. I often "transpile" my math on Desmos into some language 

## Goals
-Surpass Desmos in prototyping ability and power; have an interactive interface.
-Automatically recruit the GPU to speed up computations, but crucially make programming feel as though there is no special distinction for machine vs device code. The process is likely going to look like: source code -> LLVM IR -> cuda and a language with a graphics interface.

## Fun Goals
-Use Linear Programming Techniques to optimize performance, perhaps even at runtime; preferably I can integrate an existing LP Solver.
