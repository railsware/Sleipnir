BUILD_DIR = ./build
SOURCE_DIR = ../Sleipnir/Sleipnir

SWIFT_SOURCES = $(wildcard $(SOURCE_DIR)/**/*.swift)

all: framework

framework: libSleipnir swift_module
	cp $(BUILD_DIR)/libSleipnir ./OSX/Sleipnir.framework/Versions/A/Sleipnir
	cp $(BUILD_DIR)/Sleipnir.swiftmodule ./OSX/Sleipnir.framework/Versions/A/Modules/Sleipnir.swiftmodule/x86_64.swiftmodule

swift_module: fat_horse.swift
	xcrun --sdk macosx swift -emit-module-path $(BUILD_DIR)/ -emit-module $(BUILD_DIR)/$< -module-name Sleipnir 

libSleipnir: fat_horse.o sleipnir_loader.o
	cd $(BUILD_DIR) && ar rcs libSLeipnir $? && cd -

sleipnir_loader.o:
	 xcrun clang -c $(SOURCE_DIR)/Internals/SleipnirLoader.m -o $(BUILD_DIR)/$@

fat_horse.o: fat_horse.swift
	xcrun --sdk macosx swift -emit-library -emit-object $(BUILD_DIR)/$< -o $(BUILD_DIR)/$@ -module-name Sleipnir

fat_horse.swift:
	echo "" > $(BUILD_DIR)/$@
	for src in $(SWIFT_SOURCES); do \
			cat $${src} >> $(BUILD_DIR)/$@; \
			echo "\n" >> $(BUILD_DIR)/$@; \
	done;

clean:
	rm -rf $(BUILD_DIR)/*
	rm -rf ./OSX/Sleipnir.framework/Versions/A/Sleipnir
	rm -rf ./OSX/Sleipnir.framework/Versions/A/Modules/Sleipnir.swiftmodule/x86_64.swiftmodule

