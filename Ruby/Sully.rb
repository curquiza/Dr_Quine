def write_in_file(file, s, cpt)
  begin
    file = File.open(file, 'w')
    file.printf(s, s.inspect, cpt)
    file.close
  rescue
    puts 'Error'
  end
end

s = "def write_in_file(file, s, cpt)\n  begin\n    file = File.open(file, 'w')\n    file.printf(s, s.inspect, cpt)\n    file.close\n  rescue\n    puts 'Error'\n  end\nend\n\ns = %s\ncpt = %d\ncpt = (File.basename(__FILE__) == 'Sully.rb') ? 5 : cpt - 1\nnew_file = \"Sully_\#{cpt}.rb\"\nwrite_in_file(new_file, s, cpt)\nexec(\"ruby \#{new_file}\") unless cpt <= 0\n"
cpt = 5
cpt = (File.basename(__FILE__) == 'Sully.rb') ? 5 : cpt - 1
new_file = "Sully_#{cpt}.rb"
write_in_file(new_file, s, cpt)
exec("ruby #{new_file}") unless cpt <= 0
