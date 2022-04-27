all: build

build:
	hugo

server:
	hugo server

clean:
	-rm -rf public/ resources/ assets/jsconfig.json
	find . -name "*.ps" -delete
	find . -name "gmt.conf" -delete
	find . -name "gmt.history" -delete
