#--
# Copyright (c) 2024+ Damjan Rems
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#++

module AgileFormFields
  
###########################################################################
# Class for creating ckeditor AgileRails form field.
###########################################################################
class Ckeditor < AgileFormField
  
###########################################################################
# Return code required to render ckeditor AgileRails form field.
###########################################################################
def render
  return ro_standard if @readonly

  set_initial_value
  # read configuration from site settings
  ck_config = '/assets/ckeditor_config.js'
  ck_css    = '/assets/ckeditor_css.css'
  site      = @env.agile_get_site
  config    = site ? site.params['ckeditor'] : nil # site might not be available yet
  if config
    ck_config = config['config_file'] if config['config_file']
    ck_css    = config['css_file'] if config['css_file']
  end

  options = options_to_hash(@yaml['options'])
  options['customConfig'] = ck_config
  options['contentsCss']  = ck_css
  options['language']   ||= I18n.locale

  record = record_text_for(@yaml['name'])
  @html += @env.text_area(record, @yaml['name'], @yaml['html'])
  @js += "CKEDITOR.replace( '#{record}_#{@yaml['name']}', #{options.to_json} );"
  self
end

end
end
