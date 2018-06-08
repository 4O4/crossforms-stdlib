## What is this?

STDLIB is a PL/SQL library for Oracle Forms 10g engine used by Oracle E-Business Suite R12. 

It aims to provide a more standardized, consistent, properly namespaced and more type-safe APIs with some minimal abstraction layers as an alternative to the somewhat chaotic Oracle Forms built-in procedures and functions. 

It is designed from the ground up to assist as much as possible in [CrossForms](https://github.com/4O4/crossforms)-based projects development.

## Why to use it?

Mainly because it helps to detect most common errors during compilation or early at the Form startup, instead of at the specific program unit runtime. We’re talking especially about typos in string references to form items, blocks etc.

Also, the extra data structures provided by STDLIB can help make the code cleaner and less error-prone. Handling and delegation of forms events in PL/SQL code can be significantly simplified for example.

## Building

Use [CrossForms](https://github.com/4O4/crossforms) to build PLL library from sources. Dist output path is `forms/libraries/XX_STDLIB/dist`.