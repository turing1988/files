# files仓库说明



本仓库用于描述Mihomo和Loon



## 说明

Mihomo只支持RULE-SET规则集合类型，不支持DOMAIN-SET;

RULE-SET的解析行分为两种，即behavior是domain或classical；描述格式也分为两种text和yaml。



Loon/Surge支持RULE-SET与DOMAIN-SET两种规则集合类型，都只能使用text格式描述，不支持yaml格式。其中：

    DOMAIN-SET类似于Mihomo的behavior=domain+format=text，

    RULE-SET类似于Mihomo的behavior=classical+format=text



## 域名通配符的区别

如果要匹配google.com、www.google.com、123.mail.google.com 三个域名

mihomo的text格式描述如下，yaml方式不赘述。

    behavior=domain时: +.google.com

    behavior=classical时: DOMAIN-SUFFIX,google.com



loon/surge的描述方式如下

    DOMAINT-SET: .google.com

    RULE-SET: DOMAIN-SUFFIX,google.com

## 

## 目录说明

根据上述区别 domain_text区分为两种，分别用于支持Loon/Surge和Mihomo