SHELL=/bin/bash

COLLEEN = Colleen
GRACE = Grace
SULLY = Sully

NASM = nasm -f macho64

SRC_DIR = src
SRC = $(addprefix $(SRC_DIR)/, \
		Colleen.s \
		Grace.s \
		Sully.s \
		)

OBJ_DIR = obj
OBJ = $(SRC:$(SRC_DIR)/%.s=$(OBJ_DIR)/%.o)

all : $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(OBJ_DIR)/$(COLLEEN).o
	@ld $^ -macosx_version_min 10.8 -lSystem -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(GRACE): $(OBJ_DIR)/$(GRACE).o
	@ld $^ -macosx_version_min 10.8 -lSystem -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(SULLY): $(OBJ_DIR)/$(SULLY).o
	@ld $^ -macosx_version_min 10.8 -lSystem -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s
	@mkdir -p $(OBJ_DIR)
	@$(NASM) $< -o $@
	@printf "%-45s\033[1;32m%s\033[0m\n" "Make $@" "OK"

test_colleen: $(COLLEEN)
	diff <(./$(COLLEEN)) src/$(COLLEEN).s

test_grace: $(GRACE)
	./$(GRACE)
	diff Grace_kid.s src/$(GRACE).s

test_sully: $(SULLY)
	./Sully
	diff src/$(SULLY).s Sully_0.s || diff Sully_3.s Sully_2.s

test_all: test_colleen test_grace test_sully

clean :
	@rm -rf $(OBJ_DIR)

fclean : clean
	@rm -f $(COLLEEN) $(GRACE) $(SULLY) Sully_* Grace_kid.s

re : fclean all
