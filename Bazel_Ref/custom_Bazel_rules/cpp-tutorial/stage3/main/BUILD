"""
To build run in workspace dir stage3:
  1. bazel build //main:hello-world
  2. cat the output hello-world.ou in the bazel-bin dir
"""

load("//main:my_rule.bzl", "my_cc_library", "my_echo_rule")

dependency_rule(
    name = "hello-greet1",
    # srcs = ["hello-greet.cc"],
    content = "hello world!\n", # x is the message we write to file
#    x = 0, # for integer
)

dependency_rule(
    name = "hello-greet2",
    # srcs = ["hello-greet.cc"], # no need srcs cuz just testing provider funcitonality
    content = "hello world!!\n",
)


depender_rule(
    name = "hello-world",
    deps = [
        ":hello-greet1",
        ":hello-greet2",
    ]
)

"""Below are rules calls for the hello-world program using Bazel's C++ library rules
"""
# g++ hello-greet.cc -c -I. -o hello-greet.o
# cc_library(
#     name = "hello-greet",
#     srcs = ["hello-greet.cc"],
#     hdrs = ["hello-greet.h"],
# )

# g++ hello-world.cc hello-greet.o -I -o hello-world
# cc_binary(
#     name = "hello-world",
#     srcs = ["hello-world.cc"],
#     deps = [
#         ":hello-greet",
#         "//lib:hello-time",
#     ],
# )
