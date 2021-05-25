#!/usr/bin/env bash

cd $(dirname "$0")

set -ev

if [ -f index.Rmd ]; then rm index.Rmd; fi

for item in *.Rmd; do
  cat "$item" >> index.Rmd
  echo '' >> index.Rmd
done

Rscript -e "rmarkdown::render('index.Rmd', 'distill::distill_article')"
