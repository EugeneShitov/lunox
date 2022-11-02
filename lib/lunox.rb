require 'sanitize'

class Lunox
  def self.save(body, file_name: 'index.html', bypass_html: false)
    body = Sanitize.fragment(body) unless bypass_html
    File.open(file_name, 'w+') do |f|
      html = <<~HTML
        <!doctype html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>#{file_name}</title>
        </head>
        <body>
            <div class="info">
                #{body}
            </div>
        </body>
        </html>
      HTML
      f.write(html)
    end
  end
end
