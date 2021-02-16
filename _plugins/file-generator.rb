module Jekyll
  class DataPage < Page
    def initialize(site, base, dir, name)
      @site = site
      @base = base
      @dir = 'examples/' + dir
      @name = name
      self.process(@name)
      self.data ||= {}
      self.data['layout'] = 'default'
      self.data['title'] = data
      self.data['parent'] = 'Examples'
      self.data['nav_order'] = 2
      self.data['has_siblings'] = true
      self.content = "{%- include deepChildrenList.html -%}"
    end
  end

  class ExampleResourcePageGenerator < Generator
    def generate(site)
      datas = site.data['data']
      datas.each do |data|
        name = "#{data}.md"
        page = Jekyll::DataPage.new(site, site.source, data, name)
        page.data['title'] = data
        page.data['layout'] = 'default'
        page.data['parent'] = 'Examples'
        page.data['nav_order'] = 2
        page.data['has_siblings'] = true
        page.content = "{%- include deepChildrenList.html -%}"
        site.pages << page
      end
    end
  end

end