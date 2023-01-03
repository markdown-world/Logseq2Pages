[中文版](./README_zh.md)

# Logseq To GitHub Pages

Logseq originally had the ability to export HTML, but after exporting, all the markdown files disappeared, so I wanted to make a tool that generated Github Pages directly from the source files.

# Steps

* Add `logseq.toml` to the root directory
* Copy `gen.rb` to the root directory
* Configure `.github/workflows/gh-pages.yml`
* Configure `GitHub Pages` for the repository