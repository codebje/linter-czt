# linter-czt package

Lint Z specifications with the Community Z Tools.

![](https://img.shields.io/apm/v/linter-czt.svg)
![](https://img.shields.io/apm/l/linter-czt.svg)
![](https://img.shields.io/github/issues/codebje/linter-czt.svg)
![](https://img.shields.io/maintenance/yes/2016.svg)

![](http://xn--wxa.bje.id.au/images/linter-czt.png)

Included is a binary distribution of the CZT checker, compiled with a patch to include triggering error length information.  The source for CZT is available online at http://czt.sourceforge.net/, and the patch is included in this package's distribution and source.  The license for CZT is included in `COPYING.txt` alongside the distribution.

Only Z syntax is currently supported, and a working install of Java 8 must be available.

The linter will detect any of the ISO standard Z LaTeX environments in any 
LaTeX files, and enable CZT linting automatically.  You can control the Z 
dialect used either by setting the default dialect in the package's settings, 
or by putting '% !Z-notation: <dialect>' as the first line in your file.

I recommend the use of [latextools] and [pdf-view] for editing LaTeX documents, 
including Z specifications.

[latextools]: https://atom.io/packages/latextools
[pdf-view]: https://atom.io/packages/pdf-view
