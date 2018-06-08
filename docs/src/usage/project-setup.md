1. Add dependency to your library

    **When using newer versions of CrossForms (preferred):**

    1. Open `crossforms-module.json` file in some ditor
    2. Add `XX_STDLIB` string to `dependencies.libraries` array like this:
    
        ``` json
        {
            "name": "CUSTOM",
            "type": "library",
            "dependencies": {
                "libraries": [
                    "APPCORE",
                    "FNDSQF",
                    "XX_STDLIB"
                ]
            }
            ...
        }
        ```

    #### When using legacy version of CrossForms:

    1. Open `META-PLL` file in some editor
    2. Add `.attach LIBRARY XX_STDLIB END NOCONFIRM` at the top (below existing `.attach` commands):

        ```
        .attach LIBRARY APPCORE END NOCONFIRM
        .attach LIBRARY FNDSQF END NOCONFIRM
        .attach LIBRARY XX_STDLIB END NOCONFIRM
        ```

2. Add dependency to Form Module 

    All dependencies of your form library must also be attached to the form module which is using it. Otherwise you will end up with random, unfixable EBS crashes at runtime.

    1. Open the Form Module file (.fmb) in Oracle Forms Builder
    2. In **Object Navigator** window, click on **Attached Libraries** node
    3. Press green plus sign button on the left toolbar
    4. Type in `XX_STDLIB` and press **Attach**

        > Note: `XX_STDLIB.pll` must be available in `FORMS_PATH`. See [DevSuite configuration](/devsuite-configuration.md) for details.

        ![fmb attach lib](/assets/images/fmb-attach-lib.gif)

    5. Save the Form Module (and remember to re-deploy it)

