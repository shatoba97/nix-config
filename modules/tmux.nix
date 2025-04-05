{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    mouse = true;
    escapeTime = 0;
    keyMode = "vi";
    terminal = "screen-256color";
    extraConfig = ''
# sudo apt install xclip
set -g default-terminal "xterm-256color"

# Основной префикс
set -g prefix C-a

# Сортировка по имени
bind s choose-tree -sZ -O name

# Изменение индексов
set -g base-index 2
setw -g pane-base-index 2

# Переназначение клавиш
unbind %
bind | split-window -h 

unbind '"'
bind - split-window -v

unbind r
bind r source-file ~/.tmux.conf

bind -r j resize-pane -D 6
bind -r k resize-pane -U 6
bind -r l resize-pane -R 6
bind -r h resize-pane -L 6

bind -r m resize-pane -Z

set -g mouse on

set-window-option -g mode-keys vi
set-option set-clipboard on

bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel "xclip -i -selection clipboard"

unbind -T copy-mode-vi MouseDragEnd2Pane
'';
    plugins = with pkgs; [
       { 
         plugin = tmuxPlugins.dracula;
       }
       {
         plugin = tmuxPlugins.sensible;
       }
       {
         plugin = tmuxPlugins.sessionist;
       }
       {
         plugin = tmuxPlugins.resurrect;
         extraConfig = ''
	  set -g @resurrect-strategy-nvim 'session'
	  set -g @resurrect-capture-pane-contents 'on'
	'';
       }
       {
         plugin = tmuxPlugins.continuum;
         extraConfig = ''
       set -g @continuum-restore 'on'
       set -g @continuum-save-interval '60' # minutes
         '';
       }
    ];
  };
}
