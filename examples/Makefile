tgz:
	@find . -regex './[A-Z][a-z].*\.yaml' -type f -print0 \
	 | tar --null --files-from - -cf examples.tar
	@tar -uf examples.tar kubectl-examples
	gzip examples.tar

ver = $(shell git describe --tags)
sha = $(shell shasum -a 256 < examples.tar.gz|cut -d" " -f1)

fix-sha:
	@sed -i 's/sha256: .*$$/sha256: $(sha)/' plugins/examples.yaml

fix-version:
	@sed -i 's/v[0-9]\.[0-9]\.[0-9]/$(ver)/' plugins/examples.yaml

install: clean tgz fix-sha
	kubectl krew install --manifest=plugins/examples.yaml --archive=examples.tar.gz

ci: tgz fix-sha fix-version
	@echo github action ...

clean:
	@rm -f examples.tar.gz
	@kubectl krew uninstall examples || :