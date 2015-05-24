server:
	rm -rf public
	hugo server --watch --verbose -D -F

public:
				rm -rf public
				hugo
				git checkout public/README.md
				git add public/
				git commit
