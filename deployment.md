**deploy opensearch with kustomize file with helm**

- Create kustomize for deploy opensearch 
- add repo helm repo add opensearch https://opensearch-project.github.io/helm-charts/
```
helm repo add opensearch https://opensearch-project.github.io/helm-charts/
helm repo list
mkdir opensearch
cd opensearch
vi values.yaml
```
- create values.yaml
```
https://github.com/opensearch-project/helm-charts/blob/main/charts/opensearch/values.yaml
```
- run pull kustomize file 
```
helm template --output-dir . -f values.yaml --namespace opensearch opensearch/opensearch

wrote ./opensearch/templates/poddisruptionbudget.yaml
wrote ./opensearch/templates/configmap.yaml
wrote ./opensearch/templates/service.yaml
wrote ./opensearch/templates/service.yaml
wrote ./opensearch/templates/statefulset.yaml
```
- Create kustomize tree
- Test kustomize tree
```
kustomize build . 
```
**Push my repo into github**
```
cd networklogging
git init
git add .
git 
