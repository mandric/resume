
TAG=$(shell git symbolic-ref -q --short HEAD || git describe --tags --exact-match)

.PHONY: publish deps

publish: resume.html
	cp resume.html ~/Desktop/resume-$(TAG).html
	cp resume.html ~/Library/Mobile\ Documents/com~apple~CloudDocs/Desktop/resume-$(TAG).html

resume.html: resume.md
	markdown-it -l resume.md -o resume.html

deps:
	npm install -g markdown-it

