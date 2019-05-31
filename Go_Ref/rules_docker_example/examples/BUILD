load("@io_bazel_rules_docker//contrib:test.bzl", "container_test")
load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_image",
    "container_layer",
    "container_push",
)

container_image(
    name = "helloworld",
    base = "@ubuntu1604//image",
    entrypoint = "echo 'hello world!'",
)

# to run Go code
# run either command below or: docker run bazel/examples:go_hellloworld due to the entrypoint
container_image(
    name = "go_hellloworld",
    base = "@go_alpine//image",
    entrypoint = "go run /workspace/hello.go",
    layers = [":src"],
)

# to be able to enter the bash shell of the image object (i.e. enter a virtual environment)
# `docker run -it --rm bazel/examples:go_hellloworld`, amd you will see a workspace/ dir inside w/ a copy of hello.go program
# but won't be able to run hello.go because go is not installed in the image (aka environment)
container_image(
    name = "go_helloworld",
    base = "@ubuntu1604//image",
    entrypoint = "/bin/bash",
    layers = [":src"],
)

container_layer(
    name = "src",
    directory = "/workspace",
    files = ["//lang_images/golang:hello.go"],
)

# run `bazel run //examples:go_helloworld_gcr`
# ensure that you modify the repository
container_push(
    name = "go_helloworld_gcr",
    format = "Docker",
    image = ":go_helloworld",
    registry = "gcr.io",
    repository = "asci-toolchain-sandbox/winnie1st",
    tag = "test",
)

container_pull(
    name = "go_hello_gcr",
    registry = "gcr.io",
    repository = "asci-toolchain-sandbox/foo2",
    digest = "sha256:a518273dd9d804947051a2a0f621b2ad0dc0d67c601978850c1d261a2ab2ad26",
)
