## -*- tab-width: 2 -*-
##
## Makefile for nomnichi articles
## 
.PHONY: new
new:
	@DATE=$$(date +%Y%m%d); \
	printf "Title: %s-" "$$DATE"; read TITLE; \
	SLUG=$$(echo "$$TITLE" | tr 'A-Z' 'a-z' | tr -s ' ' '-'); \
	FILE="content/articles/$$DATE-$$SLUG/index.md"; \
	HUGO_TITLE="$$TITLE" hugo new content "$$FILE"

preview:
	hugo server --disableFastRender -D