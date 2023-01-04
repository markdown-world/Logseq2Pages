[English](./README.md)

# 从 Logseq 生成 GitHub Pages

Logseq 原本也有导出HTML的功能，但是导出 之后，所有的markdown文件都消失了，因此我希望做一个完全从源文件直接生成Github Pages的工具。

# 操作步骤

* 在根目录添加 `logseq.toml`
* 复制 `/gen.rb` & `/Gemfile` 到根目录
* 复制 `/template/*` 到根目录
* 配置 `.github/workflows/gh-pages.yml`
* 配置仓库的 `GitHub Pages`