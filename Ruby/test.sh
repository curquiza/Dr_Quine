#!/bin/bash

GREEN="\033[1;32m"
RED="\033[1;31m"
YELLOW="\033[1;33m"
DEF="\033[0m"

printf "$YELLOW%s\n$DEF" "COLLEEN"
printf "$YELLOW$>$DEF %s\n" "diff <(ruby Colleen.rb) Colleen.rb"
diff <(ruby Colleen.rb) Colleen.rb

printf "\n$YELLOW%s\n$DEF" "GRACE"
printf "$YELLOW$>$DEF %s\n" 'ruby Grace.rb'
ruby Grace.rb
printf "$YELLOW$>$DEF %s\n" "diff Grace.rb Grace_kid.rb"
diff Grace.rb Grace_kid.rb

printf "\n$YELLOW%s\n$DEF" "SULLY"
printf "$YELLOW$>$DEF %s\n" 'rm -f Sully_*.rb'
rm -f Sully_*.rb
printf "$YELLOW$>$DEF %s\n" 'ruby Sully.rb'
ruby Sully.rb
printf "$YELLOW$>$DEF %s\n" "diff Sully.rb Sully_0.rb"
diff Sully.rb Sully_0.rb
printf "$YELLOW$>$DEF %s\n" "diff Sully_3.rb Sully_2.rb"
diff Sully_3.rb Sully_2.rb
