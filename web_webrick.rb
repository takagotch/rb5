require 'webrick'
include WEBrick

s = HTTPServer.new(Port: 2000,DocumentRoot: File.join(Dir.pwd, "/html"))

trap("INT"){ s.shutdown }
s.start

#
s = HTTPSever.new(Port: 2000)

class HelloServlet < HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res['Content-Type'] = "text/html"
    res.body = %{
      <html><body>
        <p>#{req['User-Agent']}</p>
        <p>#{req.query.keys.join(', ')}</p>
      </body></html>    }
  end
end

s.mount("/hello", HelloServlet)
trap("INT"){ s.shoutdown }
s.start

