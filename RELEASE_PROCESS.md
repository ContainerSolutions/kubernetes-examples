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

Follow this doc to make a release in GitHub:

[Release](https://docs.github.com/en/github/administering-a-repository/releasing-projects-on-github/managing-releases-in-a-repository)

## Announce

Announce on various channels:

- Twitter

- LinkedIn
