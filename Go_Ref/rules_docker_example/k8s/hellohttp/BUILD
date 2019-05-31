load("@io_bazel_rules_docker//go:image.bzl", "go_image")
load("@k8s_deploy//:defaults.bzl", "k8s_deploy")

package(default_visibility = ["//visibility:public"])

go_image(
    name = "server",
    srcs = ["main.go"],
    importpath = "github.com/erain/rules_docker_example/k8s/hellohttp",
)

k8s_deploy(
    name = "dev",
    images = {
        "hello-http-image:latest": ":server",
    },
    template = ":deployment.yaml",
)
