
DIRS = \
	$(HOME)/Desktop \
	$(HOME)/Library/Mobile\ Documents/com~apple~CloudDocs/Desktop

TAG = $(shell git symbolic-ref -q --short HEAD || git describe --tags --exact-match)

.PHONY: publish unpublish deps

resume.html: resume.md
	markdown-it -l resume.md -o resume.html

publish:
	for dir in $(DIRS); do \
		cp resume.html "$$dir/resume-$(TAG).html"; \
	done

unpublish:
	for dir in $(DIRS); do \
		rm "$$dir/resume-$(TAG).html"; \
	done

deps:
	npm install -g markdown-it
