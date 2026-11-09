function operator(proxies = [], targetPlatform, context) {
  const args = $arguments || {};
  const sep = args.sep ?? '_';
  const field = args.field ?? '_subName';

  return proxies.map((proxy) => {
    const sub = proxy[field] || proxy._subName;
    if (!sub) return proxy;

    const name = `${proxy.name || ''}`.trim();
    const suffix = `${sep}${sub}`;

    if (name.endsWith(suffix)) return proxy;

    proxy.name = `${name}${suffix}`;
    return proxy;
  });
}
