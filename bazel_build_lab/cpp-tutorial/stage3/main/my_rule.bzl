heddy = provider(fields = ["x"])

def my_hello_impl(ctx):
  out = ctx.actions.declare_file("%s.o" % ctx.attr.name)
#  out = ctx.actions.declare_file("%s.size" % ctx.attr.name)
  compiler(ctx, ctx.files.srcs, out)
  return [heddy(x = ctx.attr.x)]
  # return [heddy(x = 5)]
#  return [CcInfo()]

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

def my_echo_impl(ctx):
  # result = 0
  result = ""
  for dep in ctx.attr.deps:
    result += dep[heddy].x
  ctx.actions.write(output = ctx.outputs.out, content = str(result))
  # ctx.actions.run_shell(
  #     cmd = "echo {}".format(result),
  #     use_default_shell_env = True,
  #     outputs = [ctx.outputs.lala],
  # )
  return [heddy(x = result)]

my_cc_library = rule(
    implementation = my_hello_impl,
    attrs = {
        "srcs": attr.label_list(allow_files = True),
        "deps": attr.label_list(providers = [CcInfo]),
        "x": attr.string(default = ""), # default empty, i.e. not provided in BUILD
        # "x": attr.int(default = 0),
    }
)

my_echo_rule = rule(
    implementation = my_echo_impl,
    outputs = {"out": "%{name}.ou"},
    attrs = {
        "deps": attr.label_list(providers = [heddy]),
    }
)
