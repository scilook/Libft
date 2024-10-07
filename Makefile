CC = cc
CF = -Wall -Wextra -Werror
AR = ar
AF = rcs
INC = libft.h
SRCS_BONUS = ft_lstlast_bonus.c ft_lstdelone_bonus.c ft_lstiter_bonus.c ft_lstmap_bonus.c ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstadd_back_bonus.c ft_lstsize_bonus.c ft_lstclear_bonus.c

ifndef WITH_BONUS
SRCS = ft_memchr.c ft_memcmp.c ft_memset.c ft_bzero.c ft_atoi.c ft_memmove.c ft_memcpy.c ft_split.c ft_strchr.c ft_strdup.c ft_strjoin.c ft_strlcat.c ft_strlcpy.c ft_strlen.c ft_strmapi.c ft_strncmp.c ft_strnstr.c ft_strrchr.c ft_strtrim.c ft_substr.c ft_tolower.c ft_toupper.c ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c ft_isprint.c ft_calloc.c ft_isalnum.c ft_isalpha.c ft_isascii.c ft_isdigit.c ft_itoa.c
else
SRCS = $(SRCS_BONUS)
endif

OBJS = $(SRCS:.c=.o)
OBJS_BONUS = $(SRCS_BONUS:.c=.o)
NAME = libft.a

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(AF) $(NAME) $(OBJS)

bonus: 
	make WITH_BONUS=1 all

%.o: %.c $(INC)
	$(CC) $(CF) -I. -c $< -o $@

clean:
	rm -f $(OBJS) $(OBJS_BONUS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re bonus
