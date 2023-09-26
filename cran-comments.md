## version 1.0.0

## Test environments

* local Windows, R 4.3.1
* local Mac OC (m1), R 4.3.1
* ubuntu 20.04.1 LTS (on R-hub) R-release

## R CMD check results

0 errors | 0 warnings | 0 note

However in R-hub builder, it generates below notes.

**Fedora Linux, R-devel** & **Ubuntu Linux 20.04.1 LTS, R-release, GCC**

```
* checking HTML version of manual ... NOTE
Skipping checking HTML validation: no command 'tidy' found
```

**Windows Server 2022, R-devel, 64 bit**

```
* checking for non-standard things in the check directory ... NOTE
Found the following files/directories:
  ''NULL''
  
* checking for detritus in the temp directory ... NOTE
Found the following files/directories:
  'lastMiKTeXException'
  
```

but this notes are from r-hub not shinycyjs
see below github repository issues

tidy - <https://github.com/r-hub/rhub/issues/548>
NULL - <https://github.com/r-hub/rhub/issues/560>
lastMikTeXExceptin - <https://github.com/r-hub/rhub/issues/503>


# version 0.0.11

# Round 1

## Test environments
* local Windows, R 3.6.3
* Mac OS (on travis-ci), R-oldrel.
* Ubuntu 14.04 (on travis-ci), R-oldrel, R-release, R-devel.

## R CMD check results

0 errors | 0 warnings | 0 note

## Reviewer comments

Thanks,

"Where copyrights are held by an entity other than the package authors,
this should preferably be indicated via ‘cph’ roles in the ‘Authors@R’
field, or using a ‘Copyright’ field (if necessary referring to an
inst/COPYRIGHTS file)."
e.g.: jhk0530
Please explain in the submission comments what you did about this issue.

Please add \value to .Rd files regarding exported methods and explain
the functions results in the documentation.
If a function does not return a value, please document that too, e.g.
\value{None}.

Please fix and resubmit.

Best,
Martina Schmirl

2020-03-15

## My comments

* I changed as suggested ( added 'cph' roles in 'Authors@R' ).
* I removed `LICENSE`, `LICENSE.md` file and executed `usethis::use_mit_license('jhk0530')`.

------

* I added `@return` description for what function returns.
* However, I omitted it for `renderShinyCyJS`, `ShinyCyJSOutput` and `shinyCyJS` functions.
* They are just rendering / widget functions.

## Submission comments

* I changed as suggested ( added 'cph' roles in 'Authors@R' ).
* I removed `LICENSE`, `LICENSE.md` file and executed `usethis::use_mit_license('jhk0530')`.

------

* I added `@return` description for what function returns.
* However, I omitted it for `renderShinyCyJS`, `ShinyCyJSOutput` and `shinyCyJS` functions.
* They are just rendering / widget functions.

------

* I changed version of package as I added some additional features.

* I added cran_comments.md

* check `as-cran` 0 errors, 0 warnings, 0 notes

