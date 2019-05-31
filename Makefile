NAME = lem_in

FLAGS = -Wall -Wextra -Werror
LIB_DIR = libft/
HEADER_DIR = includes/

################ INITIALIZE FILES ##################
SRC_I =			read_map.c validation.c main.c basics.c

SRC_DIR_I =		src/init/
################################################

############# ALGORITHMS FILES ##################
SRC_A =			algo_1.c

SRC_DIR_A =		src/algo/
################################################

OBJ_I = $(patsubst %.c,%.o,$(SRC_I))
OBJ_A = $(patsubst %.c,%.o,$(SRC_A))

OBJ_DIR = obj/
OBJ_DIR_I = $(OBJ_DIR)init_o/
OBJ_DIR_A = $(OBJ_DIR)algo_o/

.PHONY: all clean fclean re

all: $(NAME)

$(OBJ_DIR_A)%.o: $(SRC_DIR_A)%.c
	@mkdir -p $(OBJ_DIR_A)
	@gcc -c $< -o $@ -I./$(HEADER_DIR)

$(OBJ_DIR_I)%.o: $(SRC_DIR_I)%.c
	@mkdir -p $(OBJ_DIR_I)
	@gcc -c $< -o $@ -I./$(HEADER_DIR)

$(NAME): $(addprefix $(OBJ_DIR_I),$(OBJ_I)) $(addprefix $(OBJ_DIR_A),$(OBJ_A))
	@make -C $(LIB_DIR)
	@gcc $(addprefix $(OBJ_DIR_I),$(OBJ_I)) $(addprefix $(OBJ_DIR_A),$(OBJ_A)) -L. libft/libft.a -o $(NAME)

clean:
	@make clean -C $(LIB_DIR)
	@rm -rf $(OBJ_DIR)

fclean: clean
	@make fclean -C $(LIB_DIR)
	@rm -f $(NAME)

re: fclean all