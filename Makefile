# ====== CONFIGURATION ======
CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c99 -g
LDFLAGS :=
TARGET := main

SRC_DIR := src
BUILD_DIR := build

SRC := $(wildcard $(SRC_DIR)/*.c)
OBJ := $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC))

# ====== DEFAULT RULE ======
all: $(BUILD_DIR)/$(TARGET)

# ====== BUILD ======
$(BUILD_DIR)/$(TARGET): $(OBJ) | $(BUILD_DIR)
	$(CC) $(OBJ) -o $@ $(LDFLAGS)

# Build object files
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Create build directory if it doesn't exist
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# ====== RUN ======
run: all
	@./$(BUILD_DIR)/$(TARGET)

# ====== CLEAN ======
clean:
	rm -rf $(BUILD_DIR)

.PHONY: all run clean
