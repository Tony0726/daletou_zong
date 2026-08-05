# 大乐透 · 分析 / 预测 整合版

将 [daletou_fenxi](https://github.com/Tony0726/daletou_fenxi)（历史走势分析表）与 [daletou_yuce](https://github.com/Tony0726/daletou_yuce)（预测工具）两个独立页面整合为一个入口，点击顶部标题即可在「分析」与「预测」之间切换。

- 在线访问（GitHub Pages）：https://tony0726.github.io/daletou_zong/

## 实时更新原理

壳页面（`index.html`）通过两个 `<iframe>` 直接加载两个**源仓库自身的 GitHub Pages**：

| 标签页 | 内容来源 |
|---|---|
| 📊 大乐透历史走势分析表 | https://tony0726.github.io/daletou_fenxi/ |
| 🏆 大乐透预测工具 | https://tony0726.github.io/daletou_yuce/ |

源仓库向 `main` 分支推送代码后，其 GitHub Pages **约 1 分钟内自动重新部署**，壳页面无需任何改动即可展示最新内容——因此天然接近实时，无需任何同步机制。

> 前提：daletou_fenxi / daletou_yuce 需保持 GitHub Pages 开启状态（目前均已开启）。

## 整合方式

两个源文件是独立的单页应用（各自有同名全局函数、CSS、ID），用 `<iframe>` 隔离可避免冲突，让它们互不干扰地独立运行。
