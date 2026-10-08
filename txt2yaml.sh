#!/bin/bash
txt_d=domain_txt
yaml_d=domain_yaml
list_d=domain_list
classical_d=domain_classical
mkdir -p $yaml_d $list_d $classical_d
for txt_f in `ls -1 $txt_d`; do
    txt_p=$txt_d/$txt_f
    yaml_p=$yaml_d/`sed 's/.txt//' <<<${txt_f}`.yaml
    list_p=$list_d/`sed 's/.txt//' <<<${txt_f}`.list
    classical_p=$classical_d/`sed 's/.txt//' <<<${txt_f}`.yaml
    echo "payload:" >$yaml_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g;s/^/  \- '/g;s/$/'/g" $txt_p >>$yaml_p
    echo -n >$list_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g" $txt_p >>$list_p
    echo "payload:" >$classical_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g;s/^/  \- '/g;s/$/'/g" $txt_p >>$classical_p
done
