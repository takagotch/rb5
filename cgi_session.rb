require 'cgi'
require 'cgi/session'

cgi = CGI.new("html3")
sess = CGI::Session.new(cgi,
		        "session_key" => "rubyweb",
		        "prefix"      => "web-session.")
if sess['lastaccess']
  msg = "<p>#{sess['lastaccess']}</p>"
else
  msg = "<p>text</p>"
end

count = (sess["accesscount"] || 0).to_i
count += 1

msg << "<p>#{count}</p>"

sess["accesscount"] = count
sess["lastaccess"] = Time.now.to_s

cgi.out{
  cgi.html{
    cgi.body{
      msg
    }
  }
}

