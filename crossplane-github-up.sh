# Source: https://gist.github.com/vfarcic/c2927af7318bbdccdec62bf6577e0840

##############################################################
# How to Apply GitOps on GitHub With Argo CD And Crossplane? #
# https://youtu.be/81IJYTWZAfM                               #
##############################################################

# Additional Info:
# - How To Create A Complete Internal Developer Platform (IDP)?: https://youtu.be/Rg98GoEHBd4

#########
# Setup #
#########

# Install `gum` by following the instructions in
#   https://github.com/charmbracelet/gum#installation
# Watch https://youtu.be/U8zCHA-9VLA if you are not familiar with
#   Charm Gum.

curl -o setup.sh \
    https://raw.githubusercontent.com/vfarcic/crossplane-github/main/setup.sh

chmod +x setup.sh

./setup.sh

cd crossplane-github

#################################################
# GitOps For GitHub With Argo CD and Crossplane #
#################################################

cat chart/templates/repository.yaml

cat chart/templates/files.yaml

cat chart/templates/action-secrets.yaml

cat chart/values.yaml

cat argocd/crossplane-github-demo-repo.yaml

cp argocd/crossplane-github-demo-repo.yaml infra/.

git add .

git commit -m "Silly Demo repo"

git push

echo "http://argocd.$INGRESS_HOST.nip.io"

# Open in browser

# Use `admin` as a user and `admin123` as the password

kubectl get managed

gh repo view $GITHUB_ORG/crossplane-github-demo --web

###########
# Destroy #
###########

rm infra/*.yaml

git add . 

git commit -m "Destroy"

git push

gh repo view $GITHUB_ORG/crossplane-github-demo --web

# Confirm that the repo was removed or, if it isn't, wait until
#   it's gone.

# Reset of destroy the Kubernetes cluster
