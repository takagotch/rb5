require 'webrick'
include WEBrick

hello_proc = lambda do |req, resp|
  resp['Content-Type'] = "text/html"
  resp.body = %{
    <html><body>
      #{req['User-Agent']}
    <p>
      #{req.query.keys.join(', ')}
    </body><html>
  }
end

bye_proc = lambda do |req, resp|
  resp['Content-Type'] = "text/html"
  resp.body = %{
    <html><body>
      <h3></h3>
    </body></html>
  }
end

hello = HTTPSerblet::ProcHandler.new(hello_proc)
bye   = HTTPServlet::ProcHandler.new(bye_proc)

s = HTTPServer.new(:Port => 2000)
s.mount("/hello", hello)
s.mount("/bye", bye)

trap("INT"){ s.shutdown }
s.start

