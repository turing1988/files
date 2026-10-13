// 覆写：把 proxy-providers 中代理 url 里的 https://sub.store 换成本地后端

// 本地 Sub-Store 后端端口，按需修改
const SUBSTORE_PORT = 38324;

function main(config) {
  const providers = config["proxy-providers"];
  if (!providers || typeof providers !== "object") {
    return config; // 没有 proxy-providers，原样返回
  }

  const FROM_LIST = ["https://sub.store", "http://sub.store"];
  const TO = "http://127.0.0.1:" + SUBSTORE_PORT;

  for (const name of Object.keys(providers)) {
    const provider = providers[name];
    if (provider && typeof provider.url === "string") {
      // 用 split/join 做字面量全量替换，避免正则转义和引擎兼容问题
      for (const FROM of FROM_LIST) {
        if (provider.url.includes(FROM)) {
          provider.url = provider.url.split(FROM).join(TO);
        }
      }
    }
  }

  return config;
}
