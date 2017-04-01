hook -group cleanup global BufWritePre .* %{
  exec -draft % s\h+$ d
  echo creaned!
}     
