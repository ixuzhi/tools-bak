https://docs.github.com/en/github/authenticating-to-github/removing-sensitive-data-from-a-repository

```
git filter-branch --force --index-filter "git rm --cached --ignore-unmatch OmegaOptions.bak" --prune-empty --tag-name-filter cat -- --all
git push origin --force --all
git push origin --force --tags

git for-each-ref --format="delete %(refname)" refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
```
````
git filter-branch --force --index-filter 'git rm --cached --ignore-unmatch *.tgz' --prune-empty --tag-name-filter cat -- --all
git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
git reflog expire --expire=now --all
git gc --prune=now
git gc --aggressive --prune=now
git push --force --verbose --dry-run
git push --force
```