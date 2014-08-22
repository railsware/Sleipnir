TEMPLATES_ROOT_DIR = $(HOME)/Library/Developer/Xcode/Templates
PROJECT_TEMPLATES_DIR = "$(TEMPLATES_ROOT_DIR)/Project Templates/Sleipnir/"
FILE_TEMPLATES_DIR = "$(TEMPLATES_ROOT_DIR)/File Templates/Sleipnir/"

FILE_TEMPLATE = "Sleipnir Spec.xctemplate"
OSX_PROJECT_TEMPLATE = "OSX Sleipnir Spec Suite.xctemplate"
IOS_PROJECT_TEMPLATE = "iOS Sleipnir Spec Suite.xctemplate"

all: clean install_templates

install_templates: prepare install_file_templates install_project_templates

install_project_templates:
	cp -R $(OSX_PROJECT_TEMPLATE) $(PROJECT_TEMPLATES_DIR)
	cp -R $(IOS_PROJECT_TEMPLATE) $(PROJECT_TEMPLATES_DIR)

install_file_templates:
	cp -R $(FILE_TEMPLATE) $(FILE_TEMPLATES_DIR)

prepare:
	mkdir -p $(FILE_TEMPLATES_DIR)
	mkdir -p $(PROJECT_TEMPLATES_DIR)

clean:
	rm -rf $(FILE_TEMPLATES_DIR)
	rm -rf $(PROJECT_TEMPLATES_DIR)

