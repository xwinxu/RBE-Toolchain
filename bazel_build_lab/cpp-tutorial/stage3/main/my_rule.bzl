CcInfo = provider()

def my_hello_impl(ctx):
  out = ctx.actions.declare_file("%s.size" % ctx.attr.name)
  compiler(ctx, ctx.files.srcs, out)
  return [CcInfo()]

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


my_cc_library = rule(
  implementation = my_hello_impl,
  attrs = {
	 "srcs": attr.label_list(allow_files = True),
         "deps": attr.label_list(providers = [CcInfo]),
  }
)
