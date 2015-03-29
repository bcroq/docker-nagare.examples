FROM bcroq/nagare:latest

RUN apt-get update \
        && apt-get install -y mercurial

RUN set -x \
        && hg clone http://hg.nagare.org/examples \
        && apt-get purge -y mercurial 'python.*' \
        && cd examples \
        && python setup.py sdist \
        && mv dist/* /var/tmp/pypi \
        && cd .. \
        && rm -rf examples \
	&& easy_install -Z --find-links=/var/tmp/pypi nagare.examples

EXPOSE 8080

CMD ["serve", "--host", "0.0.0.0", "admin", "demo", "wiki", "gallery", "portal", "jewels"]
