require('vis')

vis.events.subscribe(vis.events.INIT, function()
  
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
  vis:command('set theme seti')
  vis:command('set relativenumber')
  vis:command('set autoindent on')
  vis:command('set expandtab on')
  vis:command('set tabwidth 2')
  vis:command('set show-tabs on')
  vis:command('set show-spaces on')
  vis:command('set cursorline on')

  vis:command('map! normal ,q :wq<Enter>')
end)
