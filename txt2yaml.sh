#!/bin/bash
txt_d=domain_txt
yaml_d=domain_yaml
mkdir -p $yaml_d
for txt_f in `ls -1 $txt_d`; do
    txt_p=$txt_d/$txt_f
    yaml_p=$yaml_d/`sed 's/.txt//' <<<${txt_f}`.yaml
    echo "payload:" >$yaml_p
    sed "s/^/  \- '/g;s/$/'/g" $txt_p >>$yaml_p
    sed -i "" "s|- '\.|\- '+.|g" $yaml_p
done
