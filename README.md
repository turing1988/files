# files

Surge与Loon支持RULE-SET与DOMAIN-SET两种规则集合类型，两种都采用文本(text)格式描述，不支持yaml格式描述。其中DOMAIN-SET类似与Mihomo的behavior=domain+format=text，RULE-SET类似于Mihomo的behavior=classical+format=text
    

Mihomo只支持RULE-SET规则集合类型，不支持DOMAIN-SET类型，它分为两种解析行为(behavior)domain与classical，格式又分为两种，text和yaml。


如果要匹配google.comwww.google.com 123.mail.google.com 三种字符串

mihomo
domain text: +.google.com
classical text: DOMAIN-SUFFIX,google.com

surge/loon
DOMAINT-SET: .google.com
RULE-SET: DOMAIN-SUFFIX,google.com