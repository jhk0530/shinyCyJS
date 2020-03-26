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

