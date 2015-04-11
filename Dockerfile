FROM bcroq/nagare:latest

RUN set -x \
	&& easy_install -Z "nagare.examples==dev"

EXPOSE 8080

CMD ["serve", "--host", "0.0.0.0", "admin", "demo", "wiki", "gallery", "portal", "jewels"]
