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

# making go_helloworld my base, can also :go_helloworld
container_image(
    name = "reverse",
    base = "//examples:go_helloworld",
    entrypoint = "",
)

# hello.go inside workspace/ directory
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
    repository = "asci-toolchain-sandbox/winniepush",
    tag = "test",
)

# @: go to project defined in workspace, default current project
# //: go to root of such project
# image: "file"
container_image(
    name = "go_hello_gcr",
    base = "@go_hello_gcr//image",
)

# go_alpine "pre-pulled"/exists for usage
container_image(
    name = "example_try",
    base = "@go_alpine//image",
)