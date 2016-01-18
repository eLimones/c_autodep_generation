EXEC_TARGET := myprog
CPPFLAGS += -I include
CFLAGS += -std=c99
C_SOURCE_FILES := main.c myMath.c dsp.c

OBJ_DIR := objects
OBJ_FILES:= $(patsubst %,$(OBJ_DIR)/%.o,$(basename $(C_SOURCE_FILES)))

DEPDIR := .d
DEPFLAGS = -MT $@ -MMD -MP -MF $(DEPDIR)/$*.Td
POSTCOMPILE = mv -f $(DEPDIR)/$*.Td $(DEPDIR)/$*.d

VPATH = source
.PHONY: test clean
all: $(EXEC_TARGET)
$(EXEC_TARGET): $(OBJ_FILES)
	$(CC) $^ $(CFLAGS) -o $@
$(OBJ_FILES):$(OBJ_DIR)/%.o: %.c $(DEPDIR)/%.d | $(OBJ_DIR) $(DEPDIR)
	$(CC) -c $< $(CFLAGS) $(CPPFLAGS) $(DEPFLAGS) -o $@
	$(POSTCOMPILE)
$(OBJ_DIR):
	mkdir -p $@
$(DEPDIR):
	mkdir -p $@
test: $(EXEC_TARGET)
	./$(EXEC_TARGET)
clean:
	rm -f $(EXEC_TARGET)
	rm -rf $(OBJ_DIR)
	rm -rf $(DEPDIR)

$(DEPDIR)/%.d: ;
.PRECIOUS: $(DEPDIR)/%.d

-include $(patsubst %, $(DEPDIR)/%.d,$(basename $(C_SOURCE_FILES)))
