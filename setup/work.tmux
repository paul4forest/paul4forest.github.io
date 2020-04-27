# Create windows and panes
rename-window utils 
split-window -v 'tail -f .tmux/work'
split-window -v 
neww
cat ~/.tmux/work
neww
rename-window blog
neww
rename-window music 
neww
rename-window server 
select-window -t :1 

# Tools used on desktop
# rename-window lyxjabR 
# split-window -v 'QT_X11_NO_MITSHM=1 lyx ~/rp/bioeconomy_papers/notes/readings_jrc.lyx'  
# split-window -v 'jabref ~/rp/bioeconomy_papers/bibliography/jrc_ispra.bib' 
# split-window -v 'rstudio ~/R/statisticallearning/statisticallearning.Rproj'
# split-window -v 'riot-web'
# split-window -v 'QT_X11_NO_MITSHM=1 spyder3'
# neww
# select-window -t :1 

# Vim style pane selection
bind h select-pane -L
bind j select-pane -D 
bind k select-pane -U
bind l select-pane -R

# https://thoughtbot.com/blog/love-hate-tmux
# remove administrative debris (session name, hostname, time) in status bar
set -g status-left ''
set -g status-right ''

# Conf copied from 
# https://gist.github.com/spicycode/1229612
# Automatically set window title
set-window-option -g automatic-rename on
set-option -g set-titles on

#set -g default-terminal screen-256color
set -g status-keys vi
set -g history-limit 10000

setw -g mode-keys vi
setw -g mode-mouse on
setw -g monitor-activity on

bind-key v split-window -h
bind-key s split-window -v

bind-key J resize-pane -D 5
bind-key K resize-pane -U 5
bind-key H resize-pane -L 5
bind-key L resize-pane -R 5

bind-key M-j resize-pane -D
bind-key M-k resize-pane -U
bind-key M-h resize-pane -L
bind-key M-l resize-pane -R


# Use Alt-vim keys without prefix key to switch panes
bind -n M-h select-pane -L
bind -n M-j select-pane -D 
bind -n M-k select-pane -U
bind -n M-l select-pane -R

# Use Alt-arrow keys without prefix key to switch panes
bind -n M-Left select-pane -L
bind -n M-Right select-pane -R
bind -n M-Up select-pane -U
bind -n M-Down select-pane -D

# Shift arrow to switch windows
bind -n S-Left  previous-window
bind -n S-Right next-window

# No delay for escape key press
set -sg escape-time 0

# Reload tmux config
bind r source-file ~/.tmux.conf

