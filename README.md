<h3 align="center">Upload to Release</h3>
<p align="center">A GitHub Action that uploads a file to a new release.<p>

## Usage

This action uploads any file to a new release:

<img width="926" alt="image" src="https://user-images.githubusercontent.com/10660468/49449109-2d37d400-f7a8-11e8-8e59-607c91520c96.png">

One example workflow is to build and save a Docker image then upload it to a release:

```workflow
workflow "Package" {
  on = "release"
  resolves = ["Upload to release"]
}

action "Build Docker image" {
  uses = "actions/docker/cli@master"
  args = "build . -t my-image"
}

action "Save the image" {
  uses = "actions/docker/cli@master"
  args = "save my-image:latest"
  needs = ["Build Docker image"]
}

action "Upload to release" {
  uses = "JasonEtco/upload-to-release@master"
  args = "my-image.tar"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Save the image"]
}
```

## Requirements

You must pass at least one argument, the path to the file you want to attach. You must also include the `GITHUB_TOKEN` secret, otherwise uploading the file will not work.

```workflow
action "Upload to release" {
  uses = "JasonEtco/upload-to-release@master"
  args = "my-image.tar"
  secrets = ["GITHUB_TOKEN"]
  needs = ["Save the image"]
}
```

### Content-Type

You may also need to pass an additional argument, the `Content-Type` header used when uploading your file (this is `application/zip` by default):

```workflow
action "Upload to release" {
  args = "my-image.tar application/zip"
}
```
