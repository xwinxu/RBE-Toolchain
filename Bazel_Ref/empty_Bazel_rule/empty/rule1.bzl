"""Rule that does nothing."""

def _empty_impl(ctx):
  print("This rule does nothing")

empty_rule = rule(implementation = _empty_impl)
