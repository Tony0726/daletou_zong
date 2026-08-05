# 大乐透 · 分析 / 预测 整合版

将 [daletou_fenxi](https://github.com/Tony0726/daletou_fenxi)（历史走势分析表）与 [daletou_yuce](https://github.com/Tony0726/daletou_yuce)（预测工具）两个独立页面的 `index.html` 实时同步，整合为一个页面，点击顶部标题即可在「分析」与「预测」之间切换。

- 在线访问（GitHub Pages）：https://Tony0726.github.io/daletou_zong/

## 整合方式

- `index.html` — 壳页面：顶部两个标题按钮 + 两个 `<iframe>`，点击切换显示（互不干扰，各自独立运行）。
- `fenxi/index.html` — 来自 daletou_fenxi 的同步副本。
- `yuce/index.html` — 来自 daletou_yuce 的同步副本。

## 同步机制

- **自动**：GitHub Actions 定时任务（`.github/workflows/sync.yml`）每 5 分钟拉取两个源仓库的 `index.html`，有变化自动提交推送。也可在仓库 Actions 页手动触发 `workflow_dispatch` 立即同步。
- **手动**：本地运行 `./sync.sh`，把本机两个源仓库的最新文件复制进来并推送。

> 说明：GitHub Actions 定时任务有调度延迟（高峰期可能推迟数分钟），并非严格"实时"；如需立即同步，用「手动触发」或本地脚本。

## 本地开发

```bash
./sync.sh   # 同步源文件并推送
```
