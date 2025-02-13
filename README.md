# AgileRailsHtmlEditor

Default HTML editor and file manager plugin for AgileRails. Since AgileRails doesn't come with HTML data entry field, 
AgileRailsHtmlEditor gem adds html_field and file_select data entry fields to AgileRails forms.

AgileRailsHtmlEditor consists of CKEditor html edit component and EL Finder file manager component.

Configuration
----------------

Add this line to your Gemfile:
```ruby
  gem 'agile_rails_html_editor'
```  

Usage in Forms:
```yaml
    fields:
      10:
        name: body
        type: html_field
        options: "height: 500, width: 550, toolbar: 'basic'" 
 #  or 
        options: 
          height: 500
          width: 550
          toolbar: 'basic' 
		
      20:
        name: picture
        type: file_select
        size: 50
```

Optional configuration in Site document:
```yaml
html_editor: ckeditor
ckeditor:
 config_file: /files/my_ck_config.js
 css_file: /files/my_ck_css.css
file_select: elfinder
```

License
-------

Copyright (c) 2024+ Damjan Rems

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Credits
-------

Damjan Rems: damjan dot rems at gmail dot com
