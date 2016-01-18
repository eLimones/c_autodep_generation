EXEC_TARGET := myprog
CPPFLAGS += -I include
CFLAGS += -std=c99 
C_SOURCE_FILES := main.c myMath.c dsp.c
OBJ_DIR := objects
OBJ_FILES:= $(patsubst %,$(OBJ_DIR)/%.o,$(basename $(C_SOURCE_FILES))) 
VPATH = source
.PHONY: test clean
all: $(EXEC_TARGET)
$(EXEC_TARGET): $(OBJ_FILES) 
	$(CC) $^ $(CFLAGS) -o $@
$(OBJ_DIR)/%.o: %.c | $(OBJ_DIR)
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) -o $@
$(OBJ_DIR):
	mkdir -p $@
test: $(EXEC_TARGET)
	./$(EXEC_TARGET)
clean:
	rm -f $(EXEC_TARGET)
	rm -rf $(OBJ_DIR) 
