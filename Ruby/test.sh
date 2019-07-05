#/bin/bash

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
DEF="\033[0m"

printf "$YELLOW%s\n$DEF" "COLLEEN"
printf "$YELLOW$>$DEF diff <(ruby Colleen.rb) Colleen.rb"
diff <(ruby Colleen.rb) Colleen.rb
