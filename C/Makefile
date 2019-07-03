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

$(COLLEEN): $(OBJ)
	@$(CC) $(FLAG) $(OBJ_DIR)/Colleen.o -o $(COLLEEN)
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(GRACE): $(OBJ)
	@$(CC) $(FLAG) $(OBJ_DIR)/GRACE.o -o $(GRACE)
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(SULLY): $(OBJ)
	@$(CC) $(FLAG) $(OBJ_DIR)/SULLY.o -o $(SULLY)
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(H_DIR)
	@mkdir -p $(OBJ_DIR)
	@$(CC) $(INCL) -c $< -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

test_colleen:
	diff <(./$(COLLEEN)) src/$(COLLEEN).c

test_grace:
	./$(GRACE)
	diff Grace_kid.c src/$(GRACE).c

clean :
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY)

re : fclean all
