EXEC_TARGET := myprog
.PHONY: test clean
all: $(EXEC_TARGET)
$(EXEC_TARGET): main.o myMath.o dsp.o
	gcc $^ -o $@
%.o: %.c
	gcc -c $< -o $@
test: $(EXEC_TARGET)
	./$(EXEC_TARGET)
clean:
	rm -f $(EXEC_TARGET)
	rm -f *.o 
