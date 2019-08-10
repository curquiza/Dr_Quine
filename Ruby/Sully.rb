def write_in_file(file, s, cpt)
  begin
    file = File.open(file, 'w')
    file.printf(s, s.inspect, cpt)
    file.close
  rescue
    exit
  end
end

s = "def write_in_file(file, s, cpt)\n  begin\n    file = File.open(file, 'w')\n    file.printf(s, s.inspect, cpt)\n    file.close\n  rescue\n    exit\n  end\nend\n\ns = %s\ncpt = %d\nbegin\n  tmp = File.open(\"Sully_\#{cpt}.rb\", 'r')\n  cpt -= 1\n  tmp.close\nrescue\nend\nnew_file = \"Sully_\#{cpt}.rb\"\nwrite_in_file(new_file, s, cpt)\nexec(\"ruby \#{new_file}\") unless cpt <= 0\n"
cpt = 5
begin
  tmp = File.open("Sully_#{cpt}.rb", 'r')
  cpt -= 1
  tmp.close
rescue
end
new_file = "Sully_#{cpt}.rb"
write_in_file(new_file, s, cpt)
exec("ruby #{new_file}") unless cpt <= 0
