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
add-repo:
	helm repo add gitea-charts https://dl.gitea.com/charts/
	helm repo update

update-manifest: 
	rm -rf kustomize/overlays/$(DEPLOY_ENV)/base/generated
	helm template --output-dir kustomize/overlays/$(DEPLOY_ENV)/base/generated \
		--namespace gitea \
		-f helm/values-gitea-$(DEPLOY_ENV).yaml \
		gitea gitea-charts/gitea
	find kustomize/overlays/$(DEPLOY_ENV)/base/generated -name '*.yaml'

recheck: # decrypt-secrets
	cd $(GITTOPS_OVERLAYS) 
	$(KUSTOMIZE) build .
	make clean

apply: # decrypt-secrets
	$(KUSTOMIZE) build  $(GITTOPS_OVERLAYS) | $(KUBECTL) apply -f -
	make clean

template:
	@-/bin/true && $(KUSTOMIZE) build  $(GITTOPS_OVERLAYS)

diff: # decrypt-secrets
	@-/bin/true && $(KUSTOMIZE) build --enable_alpha_plugins $(GITTOPS_OVERLAYS) | $(KUBECTL) diff -f - || echo "The manifests are changed"
	make clean
