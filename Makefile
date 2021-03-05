# Secrets
SECRET_FILES=$(shell cat .blackbox/blackbox-files.txt)
$(SECRET_FILES): %: %.gpg
	gpg --decrypt --quiet $< > $@

.PHONY: deploy
deploy: kustomize/secrets/regcred kustomize/secrets/env
	kubectl apply -k kustomize
