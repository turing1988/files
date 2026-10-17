#!/bin/bash
d_t_l_d=domain_text_loon
d_t_m_d=domain_text_mihomo
c_t_l_d=classical_text_loon
d_y_d=domain_yaml
c_y_d=classical_yaml
mkdir -p $d_t_m_d $c_t_l_d $d_y_d $c_y_d 

for t_f in `ls -1 $d_t_l_d`; do
    t_p=$d_t_l_d/$t_f 
    y_p=`sed 's/.list//' <<<${t_f}`.yaml

    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g" $t_p >$d_t_m_d/$t_f

    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g" $t_p >$c_t_l_d/$t_f

    d_y_p=$d_y_d/$y_p
    echo "payload:" >$d_y_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g;s/^/  \- '/g;s/$/'/g" $t_p >>$d_y_p

    c_y_p=$c_y_d/$y_p
    echo "payload:" >$c_y_p
    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g;s/^/  \- '/g;s/$/'/g" $t_p >>$c_y_p
done
