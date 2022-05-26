# Kubernetes-Examples Release Process

## Is Pipeline Green?

## Is Latest Kubernetes Version Supported?

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


## Generate code

Follow this doc to make a release in GitHub:

[Release](https://docs.github.com/en/github/administering-a-repository/releasing-projects-on-github/managing-releases-in-a-repository)

## Announce

Announce on various channels:

- Twitter

- LinkedIn
