# Makefile based on template at https://gist.github.com/xuhdev/1873316

CC = gcc 
CFLAGS = -fPIC -Wall -Wextra -O2 -g 
LDFLAGS = 
RM = rm -f
BIN = hello
LDLIBS = 

SRCS = hello.c
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${BIN}

$(BIN): $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o$(BIN) $(LDLIBS) 

$(SRCS:.c=.d):%.d:%.c
	$(CC) $(CFLAGS) -MM $< >$@

include $(SRCS:.c=.d)

tests: $(BIN)
	./$(BIN)

.PHONY: clean
clean:
	-${RM} ${BIN} ${OBJS} $(SRCS:.c=.d)
