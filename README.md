# files

## 说明 
Loon/Surge支持RULE-SET与DOMAIN-SET两种规则集合类型，两种都采用文本(text)格式描述，不支持yaml格式描述。其中DOMAIN-SET类似与Mihomo的behavior=domain+format=text，RULE-SET类似于Mihomo的behavior=classical+format=text

Mihomo只支持RULE-SET规则集合类型，不支持DOMAIN-SET类型; 它分为两种解析行为behavior : domain与classical，格式分为两种:text和yaml。

## 通配区别
如果要匹配google.comwww.google.com 123.mail.google.com 三种字符串
mihomo的text格式描述方式如下，yaml方式不赘述。
behavior=domain时: +.google.com
behavior=classical时: DOMAIN-SUFFIX,google.com

loon/surge的描述方式如下
DOMAINT-SET: .google.com
RULE-SET: DOMAIN-SUFFIX,google.com

## 目录说明
根据上述区别 domain_text区分为两种，分别用于支持loon和mihomo