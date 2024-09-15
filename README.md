# ReAsm

A casual try to create something useful for world.

## What is this?

This is repository for new low-level language, that aimed to extend assembly capabilities by adding features from modern languages to it and save assembly feel, performance and light binaries.

> [!NOTE]
> All designig and planning is in Russian language, but later I will translate it to different languages.

## Why assembly?

Me and my friend were brainstorming ideas and came to the conclusion, that all modern programming languages are focusing on improvment for **Java or C/C++**. Nothing personal, they are certainly breakthrough languages that have provided a lot of new things to the industry and should upgrade as time passes.

But everyone don't notice the assembler or consider it very complex and rather an additional link between the programming language and binary code. Needless to say, there are so many varieties of assembler that it's really a headache!

And perhaps we are adding our own language to this problem, but we plan to
create functions that will simplify the work with the assembler in
general and could completely replace its place.

## How do you want to achieve such goal?

Compiler. Compiler can be and should be a versatile tool to write code safe and once for every platform. Rust is a great example of it.

In our plans we will write our compiler with frontend to LLVM. We consider somehow support decompilation existing binaries to our language.

Compiler and language will be open-source and locate in this repo too.

## Where I can check progress or read about it?

- [Design sheet](/language.md)
