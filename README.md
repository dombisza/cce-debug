# ARCHIVED

moved to https://github.com/opentelekomcloud-community/debug-container

You can attach this container as [debug](https://kubernetes.io/docs/tasks/debug/debug-application/debug-running-pod/) container to you pods if your container is lacking some debug binaries.
```bash
kubectl debug -it promtail-7bwqs --image=ghcr.io/dombisza/cce-debug:main -nlogging
```
