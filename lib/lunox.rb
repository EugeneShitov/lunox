require 'nokogiri'
class CreateHTML
  def create_html(content, bypass_html, file_name: 'index.html')
    markup = content.gsub!(/[<>]/, '') if bypass_html == false
    markup = content unless bypass_html == false
    html = <<~HTML
      <!doctype html>
      <html lang="en">
      <head>
          <meta charset="UTF-8">
          <title>#{file_name}</title>
      </head>
      <body>
          #{markup}
      </body>
      </html>
    HTML
    File.write(file_name, html)
  end

  def update_html(content, file_name: 'index.html')
    doc = File.open(file_name) { |f| Nokogiri::HTML(f) }
    doc.at('body') << content

    file = File.open(file_name, 'w+')
    file.puts doc
    file.close
  end

  def open_in_browser(file_name: 'index.html')
    system("open ./#{file_name}")
  end
end
