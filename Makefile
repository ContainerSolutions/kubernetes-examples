tgz:
	@find . -regex './[A-Z][a-z].*\.yaml' -type f -print0 \
	 | tar --null --files-from - -cf examples.tar
	@tar -uf examples.tar kubectl-examples
	gzip examples.tar

sha = $(shell shasum -a 256 < examples.tar.gz|cut -d" " -f1)

update:
	@sed -i 's/sha256: .*$$/sha256: $(sha)/' plugins/examples.yaml

install: clean tgz update
	kubectl krew install --manifest=plugins/examples.yaml --archive=examples.tar.gz

clean:
	@rm -f examples.tar.gz
	@kubectl krew uninstall examples || :