# tmux-badges

Enables you to do fancy badges a-la shields.io in tmux.
Usage example:

```
# tmux.conf
set -g @badge_py     'py'
set -g @badge_py_fg  'default'
set -g @badge_py_bg  'colour27'
set -g @badge_py_cmd 'pyenv version | cut -f 1 -d " "'

set -g status-right '#{py_badge}'
```
