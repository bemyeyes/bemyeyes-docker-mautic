# BME customized mautic docker image

See the original README [here](README.original.md).

This image e.g. installs the AWS SES plugin. Check the latest commits to see what custom patches we have.

## Patches

Be My Eyes Mautic is patches in two ways:

- By editing the Dockerfiles (apache and fpm) in this repository.
- By Editing Mautic source code and producting patch files with `git format-patch`. These patch files are applied during the image build phase.

#### Why old style patch files are used instead of making a local bme fork of the mautic git repository?

When the patches are kept minimal they most likely apply to future versions of Mautic too. This means updating Mautic doesn't become hard. With patch files it can be still done by just changing the MAUTIC_VERSION in the dockerfile.

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
