EXEC_TARGET := myprog
$(EXEC_TARGET): main.c myMath.c dsp.c
	gcc $^ -o $@
test: $(EXEC_TARGET)
	./$(EXEC_TARGET)
clean:
	rm -f $(EXEC_TARGET)
