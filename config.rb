# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :middleman_simple_thumbnailer

activate :livereload

# Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

set :markdown, :fenced_code_blocks => true, :smartypants => true

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )

# Helpers
# Methods defined in the helpers block are available in templates
# https://middlemanapp.com/basics/helper-methods/

helpers do
  def image_slug(image)
    "#{parameterize(image.title)}-#{image.filename[/[0-9\-]+/]}"
  end

  def parameterize(string)
    Iconv.conv('ascii//ignore//translit', 'utf-8', string)
      .gsub(/(\W+)/, "-").downcase
  end

  def srcset(image, sizes)
    sizes.map { |size| srcset_entry(image, size) }.join(", ")
  end

  def srcset_entry(image, size)
    "#{image_path(image, resize_to: size)} #{size}w"
  end
end

# helpers do
#   def some_helper
#     'Helping'
#   end
# end

# Build-specific configuration
# https://middlemanapp.com/advanced/configuration/#environment-specific-settings

configure :build do
  activate :minify_css
  activate :minify_javascript
end
