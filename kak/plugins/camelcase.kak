#def -hidden select-next-word %{
  #exec /[A-Z][a-z]+|[A-Z\w]+|[a-z\w]+<ret><a-:>
#}
#def -hidden extend-next-word %{
  #exec ?[A-Z][a-z]+|[A-Z]+|[a-z]+<ret><a-:>
#}

def -hidden select-next-word %{
  exec /[A-Z][a-z]+|[A-Z]+|[a-z]+<ret>
}
def -hidden extend-next-word %{
  exec ?[A-Z][a-z]+|[A-Z]+|[a-z]+<ret>
}

def camel-case-enable %{
  map global normal w :select-next-word<ret>
  map global normal W :extend-next-word<ret>
}

def camel-case-disable %{
  map global normal w w
  map global normal W W
}

# for testing
# both CamelCase and underscore_notation entities
