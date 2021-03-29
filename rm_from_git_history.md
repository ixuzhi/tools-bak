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

https://docs.github.com/en/enterprise/2.18/user/github/using-git/changing-author-info

```bash

git push --force --tags origin 'refs/heads/*'

#!/bin/sh

git filter-branch --env-filter '

OLD_EMAIL="your-old-email@example.com"
CORRECT_NAME="Your Correct Name"
CORRECT_EMAIL="your-correct-email@example.com"

if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
export GIT_COMMITTER_NAME="$CORRECT_NAME"
export GIT_COMMITTER_EMAIL="$CORRECT_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
export GIT_AUTHOR_NAME="$CORRECT_NAME"
export GIT_AUTHOR_EMAIL="$CORRECT_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```

