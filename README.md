# tmux-badges

Enables you to do fancy badges a-la shields.io in tmux.
Usage example:

```
# tmux.conf
set -g @badge_py     'py'
set -g @badge_py_fg  'default'
set -g @badge_py_bg  'colour25'
set -g @badge_py_fmt '#(pyenv version | cut -f 1 -d " ")'

set -g @badge_awesome 'awesome'
set -g @badge_awesome_fmt 'true'

set -g status-right ' #{badge_py} #{badge_awesome} '
```

![sec(c)](screenshot.png)

### Related

 - [tmux-prefix-highlight](https://github.com/tmux-plugins/tmux-prefix-highlight)
 - [tmux-online-status](https://github.com/tmux-plugins/tmux-online-status)
