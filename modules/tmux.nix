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
set -g base-index 0
setw -g pane-base-index 0

# Переназначение клавиш
unbind %
bind | split-window -h 

unbind '"'
bind - split-window -v

# Kill pane without confirmation prompt
unbind x
bind-key x kill-pane

# Do not exit tmux when closing a session
set -g detach-on-destroy off

unbind r
bind r source-file ~/.config/.tmux.conf
# Передвунить окно, сделать его следующим\предыдущим  списке
bind-key > swap-window -t +1; select-window -t +1

bind-key < swap-window -t -1; select-window -t -1


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
       set -g @continuum-save-interval '5' # minutes
         '';
       }
       # {
       #   plugin = tmuxPlugins.tmux-powerline;
       # }
    ];
  };
}
