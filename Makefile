#change the name of the program here
NAME=helloworld

#add extra c file to compile here
EXTRA_SRC=

#what should be done by default - 1st target
all: $(NAME)

#generate a list of object (.o) files
OBJS=$(patsubst %.c,%.o,$(NAME).c $(EXTRA_SRC))

#main program depend on all objects, rest is done by implicit rules
$(NAME): $(OBJS)
	${CC} ${LDFLAGS} -o ${NAME} ${OBJS} ${LIBS}

#clean up rule
clean:
	rm -f $(NAME) $(OBJS)

test: $(NAME)
	./$(NAME)

#all, clean are phony rules, e.g. they should always run
.PHONY: all clean test
