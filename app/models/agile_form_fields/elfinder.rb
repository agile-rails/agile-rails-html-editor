#--
# Copyright (c) 2022+ Damjan Rems
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
# Class for creating ElFinder file manager enabled AgileRails form field.
###########################################################################
class Elfinder < AgileFormField

###########################################################################
# Return code required to render elfinder AgileRails form field.
###########################################################################
def render
  return ro_standard if @readonly

  set_initial_value
  record = record_text_for(@yaml['name'])
  @js += <<EOJS
  $('##{record}_#{@yaml['name']}').dblclick(function(){
    $('##{record}_div_#{@yaml['name']}').show();
    let f = $('##{record}_div_#{@yaml['name']}').elfinder({
      url : '/elfinder',
      baseUrl : '/assets/elfinder/',
      transport : new elFinderSupportVer1(),
      rememberLastDir: true,
      height: 490,
      docked: false,
      dialog: { width: 400, modal: true },
      lang: '#{I18n.locale}',
      getFileCallback : function(files) {
        $('##{record}_#{@yaml['name']}').val(files.url);
        $('##{record}_div_#{@yaml['name']}').hide();
      },
    });
  });
EOJS

  @html += @env.text_field(record, @yaml['name'], @yaml['html']) #+ @env.agile_image_invoke("record_#{@yaml['name']}")
  unless @record[@yaml['name']].blank? || @env.agile_dont?(@yaml['preview'], false)
    @html += %(
  <span class="ar-image-preview">
    #{(@env.image_tag(@record[@yaml['name']], title: t('agile.img_large') ) unless @record[@yaml['name']].match('<i ')) rescue ''}
  </span><div id="ar-image-preview"></div>
  )
  end
  @html += "<div id='#{record}_div_#{@yaml['name']}'></div>"

  self
end

###########################################################################
# Return html url code required for FileManager icon on CMS menu.
###########################################################################
def self.file_manager_url(env)
  url = "/assets/elfinder/elfinder.legacy.html?langCode=#{I18n.locale}"

  env.link_to( env.mi_icon('inventory_2-o', title: env.t('agile.file_manager')), '#',
                  { onclick: "window.open('#{url}', '#{env.t('agile.file_manager')}','width=700,height=500')"} )
end

end
end
