# BME customized mautic docker image

See the original README [here](README.original.md).

This image e.g. installs the AWS SES plugin. Check the latest commits to see what custom patches we have.

## New image building

Login (if necessary):

```bash
$ az login
$ az acr login --name bmeimageregistry
```

Build the image:

```bash
$ docker buildx build --platform linux/amd64 -f apache/Dockerfile -t bmeimageregistry.azurecr.io/bme-mautic .
```

If the build fails, try to give Docker at least 8GB RAM.

Push the image:

```bash
$ docker push bmeimageregistry.azurecr.io/bme-mautic
```

Image is used from Mautic Kubernetes configuration in https://github.com/bemyeyes/k8s-cluster
