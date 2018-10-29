BUILD_DIR = output
APP_NAME = news
BIN_PATH = /usr/local/bin
GZ = gz
XZ = xz

build:
	@mkdir -p $(BUILD_DIR)
	@go build -o $(BUILD_DIR)/$(GZ)/$(APP_NAME) -ldflags "-s -w"
	@echo "build success!"
	@#$(BUILD_DIR)/$(APP_NAME) -h

build-linux:
	@mkdir -p $(BUILD_DIR)
	@GOOS=linux GOARCH=amd64 go build -o $(BUILD_DIR)/$(XZ)/$(APP_NAME) -ldflags "-s -w"
	@echo "build success!"
	@#$(BUILD_DIR)/$(APP_NAME) -h

install: build
	@cp $(BUILD_DIR)/$(APP_NAME) $(BIN_PATH)

uninstall: install
	@sudo rm -rf $(BIN_PATH)/$(APP_NAME)

clean:
	@rm -vrf $(BUILD_DIR)/*
	@echo "====>clean success!"

.PHONY: help
help:
	@echo "help"
