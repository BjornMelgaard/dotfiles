hook -group cleanup global BufWritePre .* %{
  # trailing whitespaces
  try %{ exec -no-hooks -draft '%s\h+$<ret>d' }
  # expand tabs
  try %{ exec -no-hooks -draft '%@' }
}
