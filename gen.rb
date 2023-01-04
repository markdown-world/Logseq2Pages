require "markdown_extension"
require "liquid"
require "json"

site = MarkdownExtension::Site.new("./logseq.toml", :logseq)
site_name = site.config.title ? site.config.title : "My Logseq"
unless Dir.exists?("./site")
    Dir.mkdir("site")
end

site.write_data_json("./site/data.json")
kg_template = Liquid::Template.parse(File.read("./template/kg.liquid"))
f = File.new("./site/kg.html", "w")
f.puts(kg_template.render('config'=>{'title'=>site_name}))
f.close

journal_list = []
site.journals.reverse.each do |journal|
    journal_template = Liquid::Template.parse(File.read("./template/journal.liquid"))
    journal_html = journal_template.render('title'=>journal.item_name, 'content'=>journal.html)
    journal_list << journal_html
end

template = Liquid::Template.parse(File.read("./template/index.liquid"))
f = File.new("./site/index.html", "w")
f.puts(template.render('config'=>{'title'=>site_name}, 'journal_list'=>journal_list))
f.close

template = Liquid::Template.parse(File.read("./template/page.liquid"))
site.pages.each do |page|
    filename = "./site/" + page.item_name + ".html"
    f = File.new(filename, "w")
    f.puts template.render(
        'config'=>{'title'=>site_name},
        'page_title' => page.item_name,
        'page_html' => page.html)
    f.close
end

if Dir.exists?("./assets")
    `cp -r ./assets ./site/assets`
end