.PHONY: server public deploy

server:
	rm -rf public
	hugo server --watch --verbose -D -F

public:
	rm -rf public
	hugo
	git add public/
	git commit

deploy:
	git subtree push --prefix=public git@github.com:humboldtux/sbcb-demo.git gh-pages --squash
