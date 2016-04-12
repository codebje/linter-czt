# linter-czt package

Lint Z specifications with the Community Z Tools.

![](https://img.shields.io/apm/v/linter-czt.svg)
![](https://img.shields.io/apm/l/linter-czt.svg)
![](https://img.shields.io/github/issues/codebje/linter-czt.svg)
![](https://img.shields.io/maintenance/yes/2016.svg)

![](http://xn--wxa.bje.id.au/images/linter-czt.png)

Included is a binary distribution of the CZT checker, compiled with a patch to include triggering error length information.  The source for CZT is available online at http://czt.sourceforge.net/, and the patch is included in this package's distribution and source.  The license for CZT is included in `COPYING.txt` alongside the distribution.

Only Z syntax is currently supported, and a working install of Java 8 must be available.

To enable this linter, either name your file with a 'zed' extension, put '% !Z-notation' as the first line in your 'tex' file, or select the 'LaTeX Z' grammar from the grammar list.

I recommend the use of [latextools] and [pdf-view] for editing LaTeX documents, including Z specifications.
