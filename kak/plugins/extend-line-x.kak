def -params 1 extend-line-down %{
  exec "<a-:>%arg{1}X"
}
def -params 1 extend-line-up %{
  exec "<a-:><a-;>%arg{1}K<a-;>X<a-;><a-X>"
}

map global normal x ':extend-line-down %val{count}<ret>'
map global user X ':extend-line-up %val{count}<ret>'
