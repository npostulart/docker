#!/bin/bash

templates_dir="/usr/local/apache2/sites-template"
outdir="/usr/local/apache2/sites-enabled"

function template_files {
    find "${templates_dir}" \
        -mindepth 1 \
        -maxdepth 1 \
        -name '*.tmpl' \
        -print0
}

function non_template_files {
    find "${templates_dir}" \
        -mindepth 1 \
        -maxdepth 1 \
        -not \
        -name '*.tmpl' \
        -print0
}

rm -rf "${outdir}"
mkdir -p "${outdir}"

template_files | xargs -0 /substitute-env-vars.sh "${outdir}"
non_template_files | xargs -0 -I{} ln -s {} "${outdir}"

#tail -F /usr/local/apache2/logs/* &
rm -f /usr/local/apache2/logs/httpd.pid
/usr/local/bin/httpd-foreground
