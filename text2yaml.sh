#!/bin/bash
d_t_l_d=domain_text/loon
d_t_m_d=domain_text/mihomo
c_t_d=classical_text
mkdir -p $d_t_m_d $c_t_d
for t_f in `ls -1 $d_t_l_d`; do
    t_p=$d_t_l_d/$t_f 

    sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g" $t_p >$d_t_m_d/$t_f

    sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g" $t_p >$c_t_d/$t_f
done

cov_yaml=false

if $cov_yaml ; then
    d_y_d=domain_yaml
    c_y_d=classical_yaml
    mkdir -p $d_y_d $c_y_d 
    for t_f in `ls -1 $d_t_l_d`; do
        t_p=$d_t_l_d/$t_f 
        y_p=`sed 's/.list//' <<<${t_f}`.yaml
        d_y_p=$d_y_d/$y_p
        echo "payload:" >$d_y_p
        sed -E "/^\s*$/d;/^#\s*/d;s/^(\..*)$/+\1/g;s/^([^.+].*)$/\1/g;s/^/  \- '/g;s/$/'/g" $t_p >>$d_y_p

        c_y_p=$c_y_d/$y_p
        echo "payload:" >$c_y_p
        sed -E "/^\s*$/d;/^#\s*/d;s/^\.(.+)$/DOMAIN-SUFFIX,\1/g;s/^([^.+D].*)$/DOMAIN-KEYWORD,\1/g;s/^/  \- '/g;s/$/'/g" $t_p >>$c_y_p
    done
fi