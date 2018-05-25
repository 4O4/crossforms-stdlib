# CrossForms STDLIB

*The missing Standard Library for Oracle Forms 10g*

## What is this?

STDLIB is a PL/SQL library for Oracle Forms 10g engine used by Oracle E-Business Suite R12. 

It aims to provide a more standardized, consistent, properly namespaced and more type-safe APIs with some minimal abstraction layers as an alternative to the somewhat chaotic Oracle Forms built-in procedures and functions. 

It is designed from the ground up to assist as much as possible in [CrossForms](https://github.com/4O4/crossforms)-based projects development.

## Why to use it?

Mainly because it helps to detect most common errors during compilation or early at the Form startup, instead of at the specific program unit runtime. We’re talking especially about typos in string references to form items, blocks etc.

Also, the extra data structures provided by STDLIB can help make the code cleaner and less error-prone. Handling and delegation of forms events in PL/SQL code can be significantly simplified for example.

## Building

Use [CrossForms](https://github.com/4O4/crossforms) to build PLL library from sources. Dist output path is `forms/libraries/XX_STDLIB/dist`.

## Installation

1. Build `XX_STDLIB.pll` library from sources or get the prebuilt one from `forms/libraries/XX_STDLIB/dist` folder
2. Upload the whole project folder to EBS Application Server
3. Launch `./install.sh` and answer **Y** when prompted 

## Local dev environment setup

In case you want to use local installation of DevSuite to compile some library which depends on STDLIB, do one of the following:

- adjust `FORMS_PATH` to point to the `crossforms-stdlib/forms/libraries/XX_STDLIB/dist` folder
- copy `XX_STDLIB.pll` to one of the folders listed in `FORMS_PATH` and keep it up to date

`FORMS_PATH` is either an environment variable on Linux or registry key on Windows.

## Project status

This is mostly a hobby project and it’s still work-in-progress, so some APIs are not available yet and the documentation is incomplete.

It is totally usable though and the library foundation is already pretty solid, so it’s usually easy to implement missing pieces when needed.

## Is it any good?

Yes.

## License

MIT