#!/bin/bash
txt_d=domain_txt
yaml_d=domain_yaml
mkdir -p $txt_d
for yaml_f in `ls -1 $yaml_d`; do
    yaml_p=$yaml_d/$yaml_f
    txt_p=$txt_d/`sed 's/.yaml//' <<<${yaml_f}`.txt
    grep -v 'payload:' $yaml_p | sed "s/^.*\- '+././g;s/^.*\- '//g;s/'$//g" >$txt_p
done
