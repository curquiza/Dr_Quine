# comment 1
def lol; 0; end

def main
  # comment 2
  s = "# comment 1\ndef lol; 0; end\n\ndef main\n  # comment 2\n  s = %s\n  printf(s, s.inspect)\n  lol\nend\n\nmain\n"
  printf(s, s.inspect)
  lol
end

main
