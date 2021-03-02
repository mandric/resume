DIST = dist
PUBLISH_DIRS = \
	$(HOME)/Desktop \
	$(HOME)/Library/Mobile\ Documents/com~apple~CloudDocs/Desktop
TAG = $(shell git symbolic-ref -q --short HEAD || git describe --tags --exact-match)

.PHONY: publish unpublish deps clean

$(DIST)/resume.pdf: $(DIST)/resume.html
	puppeteer print $(DIST)/resume.html $(DIST)/resume.pdf

$(DIST)/resume.html: resume.md
	mkdir -p dist
	markdown-it -l resume.md -o $(DIST)/resume.html

publish:
	for dir in $(PUBLISH_DIRS); do \
		cp -r $(DIST) "$$dir/resume-$(TAG)"; \
	done

unpublish:
	for dir in $(PUBLISH_DIRS); do \
		rm -r "$$dir/resume-$(TAG)"; \
	done

deps:
	# markdown-it https://github.com/markdown-it/markdown-it
	# puppeteer-cli https://github.com/JarvusInnovations/puppeteer-cli
	npm install -g markdown-it puppeteer-cli

clean:
	rm -rf $(DIST)