activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :middleman_simple_thumbnailer

activate :external_pipeline,
  name: :brunch,
  command: "brunch #{build? ? 'build --production' : 'watch'}",
  source: ".tmp/dist",
  latency: 2

activate :livereload,
  ignore: [/\.es6/, /\.js\.map/]

page "/*.xml", layout: false
page "/*.json", layout: false
page "/*.txt", layout: false

ignore '*.es6'
ignore '*.js.map'

configure :build do
  activate :minify_css
  activate :minify_javascript
end
