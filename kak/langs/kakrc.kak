hook global WinSetOption filetype=kak %{
  try %{
    add-highlighter -group /kakrc/code regex \b(import|plug)\b 0:keyword
  }
}
