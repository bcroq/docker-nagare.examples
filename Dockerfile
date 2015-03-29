FROM bcroq/nagare:hg

RUN set -x \
        && apt-get update \
        && apt-get install -y mercurial \
        && cd /var/tmp \
        && hg clone http://hg.nagare.org/examples \
        && apt-get purge -y mercurial 'python.*' \
        && cd examples \
        && python setup.py sdist \
        && mv dist/* /var/tmp/pypi \
        && cd / \
        && rm -rf /var/tmp/examples \
	&& easy_install -Z --find-links=/var/tmp/pypi nagare.examples

EXPOSE 8080

CMD ["serve", "--host", "0.0.0.0", "admin", "demo", "wiki", "gallery", "portal", "jewels"]
