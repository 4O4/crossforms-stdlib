## What exactly is a "struct"? There is no such thing in PL/SQL!

In the scope of this project, struct is just a PL/SQL record that is usually pre-populated with some sane defaults and comes with an accompaning `std_<struct name>` package. 

The package contains at least these two helpers:

- `new(...)` - initializer
- `is_null(...)` - custom null checker (`IS NULL` operator does not work with record types)

