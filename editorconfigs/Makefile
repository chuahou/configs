.PHONY: install extract

default: # print usage
	@echo "make install: install this configuration"
	@echo "make extract: get current configuration"

install:
	./vsextensions.sh install vsextensions.txt # install extensions list
	cp vscode_settings.json ~/.config/Code/User/settings.json # copy settings

extract:
	./vsextensions.sh exportnew vsextensions.txt # get current extensions
	cp ~/.config/Code/User/settings.json vscode_settings.json # extract settings
