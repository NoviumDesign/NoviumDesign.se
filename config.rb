###
# Compass
###

# Susy grids in Compass
# First: gem install susy
# require 'susy'

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :blog do |blog|
  # set options on blog
  blog.prefix = "blog"
  blog.permalink = ":year-:month-:day-:title"
  # blog.layout = "blog"
  blog.default_extension = ".markdown"
end

# Markdown parser config
set :markdown_engine, :redcarpet
set :markdown,  :fenced_code_blocks => true,
                :autolink => true, 
                :smartypants => true

# Set asset paths
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'img'

# Super-pretty URL:s using directorys for every html-page.
activate :directory_indexes

# Prevent middleman from putting a layout to the sitemap.xml
page "/sitemap.xml", :layout => false

# Use relative URLs
# activate :relative_assets

# Build-specific configuration
configure :build do
  ignore 'img/*.psd'
  ignore 'css/lib/*'
  ignore 'css/vendor/*'
  ignore 'js/lib/*'
  ignore 'js/vendor/*'

  # Minify CSS
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash, :ignore => 'img/signature/novium.png'

  # Minify HTML
  activate :minify_html

  # GZip on build
  activate :gzip

  # Compress PNGs after build
  # First: gem install middleman-smusher
  require "middleman-smusher"
  activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end