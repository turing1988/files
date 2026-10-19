// 覆写：把 proxy-providers 中代理 url 里的 https://sub.store 换成本地后端

// 本地 Sub-Store 后端端口，按需修改
const SUBSTORE_PORT = 38324;

function main(config) {
  const TAG = "[substore-override]";

  const providers = config["proxy-providers"];
  if (!providers || typeof providers !== "object") {
    console.log(`${TAG} 未找到 proxy-providers，配置原样返回`);
    return config; // 没有 proxy-providers，原样返回
  }

  const FROM_LIST = ["https://sub.store", "http://sub.store"];
  const TO = "http://127.0.0.1:" + SUBSTORE_PORT;

  console.log(`${TAG} 开始处理 ${Object.keys(providers).length} 个 proxy-providers`);

  let replacedCount = 0;

  for (const name of Object.keys(providers)) {
    const provider = providers[name];
    if (provider && typeof provider.url === "string") {
      // 用 split/join 做字面量全量替换，避免正则转义和引擎兼容问题
      let changed = false;
      for (const FROM of FROM_LIST) {
        if (provider.url.includes(FROM)) {
          const before = provider.url;
          provider.url = provider.url.split(FROM).join(TO);
          changed = true;
          console.log(`${TAG} [${name}] 替换 ${FROM} -> ${TO}`);
          console.log(`${TAG} [${name}] 替换前: ${before}`);
          console.log(`${TAG} [${name}] 替换后: ${provider.url}`);
        }
      }
      if (!changed) {
        console.log(`${TAG} [${name}] 未匹配到 sub.store，url 保持不变: ${provider.url}`);
      } else {
        replacedCount++;
      }
    } else {
      console.log(`${TAG} [${name}] 缺少 url 字段或类型不对，跳过`);
    }
  }

  console.log(`${TAG} 处理完成，共替换 ${replacedCount} 个 provider 的 url`);

  return config;
}
