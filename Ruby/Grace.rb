# comment
s = "# comment\ns = %s\nbegin\n  file = File.open('Grace_kid.rb', 'w')\n  file.printf(s, s.inspect)\n  file.close\nrescue\n  puts 'Error'\nend\n"
begin
  file = File.open('Grace_kid.rb', 'w')
  file.printf(s, s.inspect)
  file.close
rescue
  puts 'Error'
end
