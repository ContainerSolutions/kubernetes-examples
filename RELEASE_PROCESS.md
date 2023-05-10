# Kubernetes-Examples Release Process

## Is Pipeline Green?

## Is Latest Kubernetes Version Supported?

Ensure examples are consistent with latest Kubernetes version.
It can be checked using `bin/test.sh` and `tests/api_check.sh`.

## Fetch Tags and Diff

Get the latest tags:

```
git fetch --tag
git tag
```

Diff the current code tag from the last one, and update the `RELEASE_NOTES.md` file, eg:

```
git diff -w v0.0.2
```

Alternatively you can use commit messages since latest release to get list of changes:

```
git log --pretty=oneline "$(git tag --sort=-creatordate | grep '^v' | head -1)...master"
```

## Get List of Added, Modified and Deleted Files

List of added(A), modified(M) and deleted(D) files can also be used to update the `RELEASE_NOTES.md` file.

Get the list of added files:

```
git diff --stat --name-only --diff-filter=A -w v0.0.4
```

Get the list of modified files:

```
git diff --stat --name-only --diff-filter=M -w v0.0.4
```

Get the list of deleted files:

```
git diff --stat --name-only --diff-filter=D -w v0.0.4
```

## Generate Code

After all changes related to `RELEASE_NOTES.md` are merged, you can create and push a new tag with a new version.
With `.github/workflows/release.yml` GitHub Action, new release will be created.
Please update release notes on the release to match the updated content on `RELEASE_NOTES.md`.

Check this doc for more information to make a release in GitHub:

[Release](https://docs.github.com/en/github/administering-a-repository/releasing-projects-on-github/managing-releases-in-a-repository)

## Updating Web UI

As it can be seen in [README](README.md#kubernetes-examples), searchable web UI of the project is [here](https://containersolutions.github.io/kubernetes-examples/).
To update Web UI you can follow these steps:

1. Update example files by running following commands:
    ```
    # please run these commands at the root directory of the repository
    git checkout master
	
	# ensure you have latest master branch locally
	git pull
	
	# get git commit hash of master branch
	MASTER_GIT_HASH=$(git rev-parse --short=8 HEAD)
    
    # checkout kubernetes-examples-UI branch
    git checkout kubernetes-examples-UI
	
	# ensure you have latest kubernetes-examples-UI branch locally
	git pull
    
    # create a branch for updates
    BRANCH_NAME=kubernetes-examples-UI-update-${MASTER_GIT_HASH}-$(date +'%d%m%y')
    git checkout -b ${BRANCH_NAME}
    
    # update examples folder
    git subtree pull --prefix examples https://github.com/ContainerSolutions/kubernetes-examples.git  master --squash
    ```

2. Check missing index files for any of the example directories and add missing index files if it's needed.

    ```
	./release.sh
    ```


3. Test updated web UI locally

    You should have ruby installed to test web UI. If you haven't run this project locally before, you should install ruby and gems first.

    Install ruby: https://www.ruby-lang.org/en/downloads/

    Install gems while you are on kubernetes-examples-UI branch:
    
	```
    gem install bundler
    bundle install
    ```

    After installation, you can run jekyll locally while you are on kubernetes-examples-UI branch:

    ```
    bundle exec jekyll serve
    ```

4. Commit changes on the new branch and push
5. Create a Pull Request to merge updated kubernetes-examples-UI-update-... branch to kubernetes-examples-UI branch.
6. Check CI run for the Pull Request kubernetes-examples-UI branch
7. Request a review for the proposed updates
8. After the PR is merged, confirm updates on the live page

## Announce

Announce on various channels:

- Twitter
- LinkedIn
