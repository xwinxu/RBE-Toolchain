"""
Example of how to utilize providers when defining Bazel rules with dependency relationships. To run:
    1. cd into stage3 directory (or WORKSPACE directory)
    2. Run `bazel build //main:msg
    3. View the message in message.ou
"""

# create a struct to store information
provInfo = provider(fields = ["content"])

def _dependency_impl(ctx):
    """The dependency that the depender depends on.
    Just returns a provider with it's field content set to the content inside attr.content
    """
#  out = ctx.actions.declare_file("%s.o" % ctx.attr.name)
#  compiler(ctx, ctx.files.srcs, out)
  return [provInfo(content = ctx.attr.content)]

def _quote(s):
    """Quotes the given string for use in a shell command.
    This function quotes the given string (in case it contains spaces or other
    shell metacharacters.)
    Args:
      s: The string to quote.
    Returns:
      A quoted version of the string that can be passed to a shell command.
    """
    return "'" + s.replace("'", "'\\''") + "'"

def compiler(ctx, srcs, out):
    """Compiles the hello-greet file in C++"""
  cmd = "g++ -Wall -g -c {srcs} -o {out}.o".format(
      srcs = " ".join([_quote(src.path) for src in srcs]),
      out = ctx.attr.name
  )

  ctx.actions.run_shell(
      command = cmd,
      outputs = [out],
      inputs = srcs,
      mnemonic = "gplusplusCompile",
      use_default_shell_env = True,
  )

def _depender_impl(ctx):
  result = ""
  # iterate through the dependencies attribute and accumulate the messages
  for dep in ctx.attr.deps:
    result += dep[provInfo].content
  ctx.actions.write(output = ctx.outputs.out, content = str(result))
  # to run shell command
  # ctx.actions.run_shell(
  #     cmd = "echo {}".format(result),
  #     use_default_shell_env = True,
  #     outputs = [ctx.outputs.lala],
  # )
  return [provInfo(content = result)]

dependency_rule = rule(
    implementation = _dependency_impl,
    attrs = {
#        "srcs": attr.label_list(allow_files = True),
        "content": attr.string(default = ""), # default empty, i.e. not provided in BUILD
        # "content": attr.int(default = 0),
    }
)

depender_rule = rule(
    implementation = _depender_impl,
    outputs = {"out": "%{name}.ou"},
    attrs = {
        # note: it is a list because there can be multiple providers & fields
        "deps": attr.label_list(providers = [provInfo]),
    }
)
