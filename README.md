# 大乐透 · 分析 / 预测 整合版

将 [daletou_fenxi](https://github.com/Tony0726/daletou_fenxi)（历史走势分析表）与 [daletou_yuce](https://github.com/Tony0726/daletou_yuce)（预测工具）两个独立页面整合为一个入口，点击顶部标题即可在「分析」与「预测」之间切换。

- 在线访问（Cloudflare Pages）：https://daletou-zong.pages.dev/
- 备用（GitHub Pages）：https://tony0726.github.io/daletou_zong/

## 实时更新原理

壳页面（`index.html`）通过两个 `<iframe>` 直接加载两个网站的 **Cloudflare Pages**：

| 标签页 | 内容来源 |
|---|---|
| 📊 大乐透历史走势分析表 | https://daletou-fenxi.pages.dev |
| 🏆 大乐透预测工具 | https://daletou-yuce.pages.dev |

源网站更新部署后，壳页面无需任何改动即可展示最新内容——天然接近实时，无需任何同步机制。

## 整合方式

两个源文件是独立的单页应用（各自有同名全局函数、CSS、ID），用 `<iframe>` 隔离可避免冲突，让它们互不干扰地独立运行。
