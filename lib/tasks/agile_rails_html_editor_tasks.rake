require 'fileutils'

desc "Copy CK Editor & ElFinder files to public/assets/ directory"
task "assets:precompile" do
  p 'Copying ckeditor to public/assets directory'
  output_dir = Rails.root.join('public/assets')
  input_dir  = File.realpath( File.dirname(__FILE__) + '/../../app/assets/javascripts/ckeditor')
  cp_r(input_dir, output_dir, verbose: true)

  p 'Copying elfinder files to public/assets directory '
  input_dir  = File.realpath( File.dirname(__FILE__) + '/../../app/assets/javascripts/elfinder')
  output_dir =  Rails.root.join('public/assets')
  cp_r(input_dir, output_dir, verbose: true)
end
