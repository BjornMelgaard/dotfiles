{ writeShellScriptBin, tmux }:

writeShellScriptBin "tmuxx" ''
  ${tmux}/bin/tmux attach || ${tmux}/bin/tmux new-session
''
