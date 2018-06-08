In case you need to use local installation of DevSuite to edit or compile some module / library which depends on STDLIB, do one of the following:

- adjust `FORMS_PATH` to point to the `crossforms-stdlib/forms/libraries/XX_STDLIB/dist` folder
- copy `XX_STDLIB.pll` to one of the folders listed in `FORMS_PATH` and keep it up to date

`FORMS_PATH` is either an environment variable on Linux or registry key on Windows.