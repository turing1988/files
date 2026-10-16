#!/bin/bash
txt_d=domain_text
yaml_d=domain_yaml
txt_d_m=domain_text_mihomo
list_d=classical_text
classical_d=classical_yaml
mkdir -p $yaml_d $list_d $classical_d $txt_d_m
for txt_f in `ls -1 $txt_d`; do
    txt_p=$txt_d/$txt_f
    txt_p_m=$txt_d_m/$txt_f
    list_p=$list_d/$txt_f
    yaml_p=$yaml_d/`sed 's/.txt//' <<<${txt_f}`.yaml
    classical_p=$classical_d/`sed 's/.txt//' <<<${txt_f}`.yaml
    echo -n $txt_p_m
    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g" $txt_p >>$txt_p_m
    echo "payload:" >$yaml_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g;s/^/  \- '/g;s/$/'/g" $txt_p >>$yaml_p
    echo -n >$list_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g" $txt_p >>$list_p
    echo "payload:" >$classical_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g;s/^/  \- '/g;s/$/'/g" $txt_p >>$classical_p
done
