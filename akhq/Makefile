.PHONY: help

export DEPLOY_ENV ?= dev
KUBECTL := kubectl # --kubeconfig kustomize/overlays/$(DEPLOY_ENV)/.kube/kubeconfig.yaml
KUSTOMIZE ?= kustomize
GITTOPS_OVERLAYS := kustomize/overlays/$(DEPLOY_ENV)
GIT_DESCRIBE ?=

help: ##show this help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\n",sprintf("\n%22c"," "), $$22);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@echo
	@echo 'DEPLOY_ENV: $(DEPLOY_ENV)'

decrypt-secrets: # Decrypted secrets
	sops -d --output $(GITTOPS_OVERLAYS)/.kube/kubeconfig.yaml $(GITTOPS_OVERLAYS)/.kube/kubeconfig.enc.yaml

clean:  ## Delete decrypted secrets
	rm -f $(GITTOPS_OVERLAYS)/.kube/kubeconfig.yaml

undeploy: # decrypt-secrets
	-$(KUBECTL) build --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) delete -f -
	make clean

addrepo:
	helm repo add akhq https://akhq.io/

update-manifest: ## add helm template --validate
	rm -rf kustomize/overlays/$(DEPLOY_ENV)/base/generated
	helm template --output-dir kustomize/overlays/$(DEPLOY_ENV)/base/generated \
		--version 0.25.1 \
		--namespace netwok-logging \
		-f helm/values-akhq-$(DEPLOY_ENV).yaml \
		akhq helm/chart/akhq
	find kustomize/overlays/$(DEPLOY_ENV)/base/generated -name '*.yaml'

createkus:
	cd $(GITTOPS_OVERLAYS) && kustomize create --resources base --namespace netwok-logging
	cd $(GITTOPS_OVERLAYS)/base && kustomize create --resources generated

apply: # decrypt-secrets
	$(KUSTOMIZE) build  --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) apply -f -
	make clean

template:
	@-/bin/true && $(KUSTOMIZE) build  $(GITTOPS_OVERLAYS)

diff: # decrypt-secrets
	@-/bin/true && $(KUSTOMIZE) build --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) diff -f - || echo "The manifests are changed"
	make clean
