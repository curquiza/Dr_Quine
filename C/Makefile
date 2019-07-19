SHELL=/bin/bash

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

FLAG = -Wall -Wextra -Werror
CC = gcc $(FLAG)

SRC_DIR = src
SRC = $(addprefix $(SRC_DIR)/, \
		Colleen.c \
		Grace.c \
		Sully.c)

OBJ_DIR = obj
OBJ = $(SRC:$(SRC_DIR)/%.c=$(OBJ_DIR)/%.o)

all : $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJ_DIR)/$(COLLEEN).o
	@$(CC) $^ -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(GRACE): $(OBJ_DIR)/$(GRACE).o
	@$(CC) $^ -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(SULLY): $(OBJ_DIR)/$(SULLY).o
	@$(CC) $^ -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(OBJ_DIR)
	@$(CC) -c $< -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

test_colleen: $(COLLEEN)
	diff <(./$(COLLEEN)) src/$(COLLEEN).c

test_grace: $(GRACE)
	./$(GRACE)
	diff Grace_kid.c src/$(GRACE).c

test_sully: $(SULLY)
	rm -f Sully_*
	./Sully
	diff src/$(SULLY).c Sully_0.c || diff Sully_3.c Sully_2.c

test_all: test_colleen test_grace test_sully

clean :
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY) Sully_* Grace_kid.c

re : fclean all
