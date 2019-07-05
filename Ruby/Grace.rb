# comment
s = "# comment\ns = %s\nbegin\n  file = File.open('Grace_kid.rb', 'w')\nrescue\n  puts 'Error'\nelse\n  file.printf(s, s.inspect)\n  file.close\nend\n"
begin
  file = File.open('Grace_kid.rb', 'w')
rescue
  puts 'Error'
else
  file.printf(s, s.inspect)
  file.close
end
