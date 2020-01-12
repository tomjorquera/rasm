SRCS=$(wildcard *.s)

OBJS=$(SRCS:.s=.o)
EXES=$(SRCS:.s=)

.PHONY: all
all: $(EXES)

.PHONY: clean
clean:
	rm -vf $(OBJS) $(EXES)

.PHONY: run
run: $(target)
	@./$(target);echo $$?

.PHONY: debug
debug: $(target)
	gdb --args ./$(target)

$(EXES): %: %.o
	gcc -o $@ $+

%.o: %.s
	as -o $@ $<

