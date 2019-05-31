load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

git_repository(
    name = "io_bazel_rules_docker",
    commit = "67d567bcfe5920acfaec270c41aa3e5f3262ca42",
    remote = "https://github.com/bazelbuild/rules_docker.git",
)

load(
    "@io_bazel_rules_docker//repositories:repositories.bzl",
    container_repositories = "repositories",
)

container_repositories()

load(
    "@io_bazel_rules_docker//container:container.bzl",
    "container_pull",
)

# Pulling image
container_pull(
    name = "ubuntu1604",
    digest = "sha256:e4a134999bea4abb4a27bc437e6118fdddfb172e1b9d683129b74d254af51675",
    registry = "index.docker.io",
    repository = "library/ubuntu",
)

# Pulling image
container_pull(
    name = "go_alpine",
    registry = "index.docker.io",
    repository = "library/golang",
    tag = "alpine",
)

# cc_image
load(
    "@io_bazel_rules_docker//cc:image.bzl",
    _cc_image_repos = "repositories",
)

_cc_image_repos()

# For our go_image test.
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "62ec3496a00445889a843062de9930c228b770218c735eca89c67949cd967c3f",
    url = "https://github.com/bazelbuild/rules_go/releases/download/0.16.4/rules_go-0.16.4.tar.gz",
)

load("@io_bazel_rules_go//go:def.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

# go_image
load(
    "@io_bazel_rules_docker//go:image.bzl",
    _go_image_repos = "repositories",
)

_go_image_repos()

# rules_k8s
git_repository(
    name = "io_bazel_rules_k8s",
    commit = "47af463e41f7c206a1494721b973e24393831d9d",
    remote = "https://github.com/bazelbuild/rules_k8s.git",
)

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_repositories")

k8s_repositories()

load("@io_bazel_rules_k8s//k8s:k8s.bzl", "k8s_defaults")

k8s_defaults(
    # This becomes the name of the @repository and the rule
    # you will import in your BUILD files.
    name = "k8s_deploy",
    # This is the name of the cluster as it appears in:
    #   kubectl config view --minify -o=jsonpath='{.contexts[0].context.cluster}'
    cluster = "gke_yiyu-gke-dev_us-central1-c_brownbag",
    image_chroot = "gcr.io/yiyu-gke-dev/rules-k8s",
    kind = "deployment",
)
