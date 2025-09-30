.PHONY: help

export DEPLOY_ENV ?= dev
KUBECTL := kubectl # --kubeconfig kustomize/overlays/$(DEPLOY_ENV)/.kube/kubeconfig.yaml
KUSTOMIZE ?= kustomize
GITTOPS_OVERLAYS := kustomize/overlays/$(DEPLOY_ENV)
GIT_DESCRIBE ?=

help:
	@echo 'DEPLOY_ENV: $(DEPLOY_ENV)'

# decrypt-secrets:
#	sops -d --output $(GITTOPS_OVERLAYS)/.kube/kubeconfig.yaml $(GITTOPS_OVERLAYS)/.kube/kubeconfig.enc.yaml

clean: 
	rm -f $(GITTOPS_OVERLAYS)/.kube/kubeconfig.yaml

undeploy: # decrypt-secrets
	-$(KUBECTL) build --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) delete -f -
	make clean

addrepo:
	helm repo add opensearch https://opensearch-project.github.io/helm-charts/
	helm repo update opensearch
update-manifest: 
	rm -rf kustomize/overlays/$(DEPLOY_ENV)/base/generated
	helm template --output-dir kustomize/overlays/$(DEPLOY_ENV)/base/generated \
		--version 2.31.0 \
		--namespace netwok-logging \
		-f values-opensearch.yaml \
		opensearch opensearch/opensearch
	find kustomize/overlays/$(DEPLOY_ENV)/base/generated -name '*.yaml'

createkus:
	cd $(GITTOPS_OVERLAYS) && kustomize create --resources base --namespace netwok-logging
	cd $(GITTOPS_OVERLAYS)/base && kustomize create --resources generated

apply: # decrypt-secrets
	$(KUSTOMIZE) build  $(GITTOPS_OVERLAYS) | $(KUBECTL) apply -f -
	make clean

template:
	@-/bin/true && $(KUSTOMIZE) build  $(GITTOPS_OVERLAYS)

diff: # decrypt-secrets
	@-/bin/true && $(KUSTOMIZE) build --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) diff -f - || echo "The manifests are changed"
	make clean

