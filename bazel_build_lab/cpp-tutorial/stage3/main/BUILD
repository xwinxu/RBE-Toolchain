load("//main:my_rule.bzl", "my_cc_library")

my_cc_library(
    name = "hello-greet",
    srcs = ["hello-greet.cc"],
    deps = [],
)
# g++ hello-greet.cc -c -I. -o hello-greet.o
# cc_library(
#     name = "hello-greet",
#     srcs = ["hello-greet.cc"],
#     hdrs = ["hello-greet.h"],
# )

# g++ hello-world.cc hello-greet.o -o hello-world
cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    deps = [
        ":hello-greet",
        "//lib:hello-time",
    ],
)

# sum(
#     name = "mysum",
#     number = 100,
#     deps = [],
#     )
