.PHONY: install extract

default: # print usage
	@echo "make install: install this configuration"
	@echo "make installsettings: copy settings.json only"
	@echo "make extract: get current configuration"

install: installsettings
	./vsextensions.sh install vsextensions.txt # install extensions list

installsettings:
	cp vscode_settings.json ~/.config/Code/User/settings.json # copy settings


extract:
	./vsextensions.sh exportnew vsextensions.txt # get current extensions
	cp ~/.config/Code/User/settings.json vscode_settings.json # extract settings
