PYTHON   ?= python

all:

test:
	python3 -m pytest
	python3 -m pytest --flake8 nio
	python3 -m pytest --isort nio
	python3 -m pytest --cov nio

clean:
	-rm -r dist/ __pycache__/
	-rm -r packages/

install:
	$(PYTHON) setup.py build
	$(PYTHON) setup.py install --skip-build -O1 --root=$(DESTDIR)

archpkg:
	$(PYTHON) setup.py sdist --dist-dir packages
	cp contrib/archlinux/pkgbuild/PKGBUILD packages
	cd packages && makepkg -ci


.PHONY: all clean test
