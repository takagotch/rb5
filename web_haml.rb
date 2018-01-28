require 'haml'
engine = Haml::Engine.new(%{
%body
  #welcome-box
    %p= greeting
  %p
    AS of
    = Time.now
    the reason you gave were:
  %table
    %tr
      %th Reason
      %th Rank
    - for reason in reasons
      %tr
        %td= reason[:reason_name]
	%td= reason[:rank]
})

data = {
  greeting: 'Hello!',
  reasons: [
    { reason_name: 'flexible', rank: '87' },
    { reason_name: 'transparent', rank: '76' },
    { reason_name: 'fun', rank: '94' },
  ]
}
puts enfine.render(nil, data)

