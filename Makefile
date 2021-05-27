all: build

build:
	hugo

server:
	hugo server

clean:
	-rm -r public/ resources/
	find . -name "*.ps" -delete
	find . -name "gmt.conf" -delete
	find . -name "gmt.history" -delete
