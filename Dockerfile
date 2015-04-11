FROM bcroq/stackless:2.7.9

RUN set -x \
	&& easy_install -Z "nagare.examples==dev"

EXPOSE 8080

ENTRYPOINT ["nagare-admin"]
CMD ["serve", "--host", "0.0.0.0", "admin", "demo", "wiki", "gallery", "portal", "jewels"]
