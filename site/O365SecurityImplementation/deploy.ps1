git add .
mkdocs build
git commit -m $args[0]
git push
mkdocs gh-deploy