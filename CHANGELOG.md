## 0.7.0 - Better error message detection
- Syntax errors and warnings are now reported properly
- `language-latex` is now an Atom dependency
- fixes #1 by recognising continuation lines

## 0.6.0 - Transitive dependency change
- `atom-linter` changed to use `sb-exec`, fix resulting bug here

## 0.5.0 - Auto-detect Z
- The mode line is now only necessary to set a per-file dialect
- Any LaTeX file with Z environments should auto-lint
- Added a configuration option for default CZT dialect

## 0.4.3 - Understanding APM
- Doc changes, mostly

## 0.2.0 - Z grammar
* No longer runs for all LaTeX files
* Now looks for '% !Z-notation' first line
* Alternatively, pick 'Latex Zed' from grammar box

## 0.1.0 - First Release
* Initial crack at it
