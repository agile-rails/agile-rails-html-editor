$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'agile_rails_html_editor/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'agile-rails-html-editor'
  s.version     = AgileRailsHtmlEditor::VERSION
  s.authors     = ['Damjan Rems']
  s.email       = ['damjan.rems@gmail.com']
  s.homepage    = 'https://github.com/agile-rails'
  s.summary     = 'AgileRails: HTML editor and file manager plugin'
  s.description = 'AgileRails: HTML editor and file manager plugin. Package consists of CKEditor component and ElFinder file manager component.'
  s.license     = 'MIT'

  #s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.files = Dir['{app,config,db,lib}/**/*'] + %w[MIT-LICENSE Rakefile README.md agile_rails_html_editor.gemspec]

  #s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '> 7'
  s.add_dependency 'image_size', '> 3'
end
