{ config, lib, pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

   oh-my-zsh = {
      enable = true;
      plugins = [ "git""docker" "kubectl" ];
  };

    shellAliases =
      let
        flakeDir = "~/nix-home";
      in {
        hm = "home-manager";
        sw = "hm os switch";
        upd = "hm os switch --update";
        hms = "hm switch --flake .#alex";

        pkgs = "nvim ${flakeDir}/modules/";

        r = "ranger";
        v = "nvim";
        se = "sudoedit";
        microfetch = "microfetch && echo";

        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gp = "git push";

        ".." = "cd ..";
      };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    initExtra = ''
      # Start Tmux automatically if not already running. No Tmux in TTY
      #if [ -z "$TMUX" ] && [ -n "$DISPLAY" ]; then
        #tmux attach-session -t default || tmux new-session -s default
      #fi

      # Start UWSM
      #if uwsm check may-start > /dev/null && uwsm select; then
      #  exec systemd-cat -t uwsm_start uwsm start default
      #fi
      #export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

      # Path to your Oh My Zsh installation.
      export ZSH="$HOME/.oh-my-zsh"
      export PATH=$PATH:/nix/var/nix/profiles/default/bin/
      #echo ~/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      #sudo usermod -s ~/.nix-profile/bin/zsh $USER
      

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 15

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 7.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"
# history setup
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1002
HISTSIZE=1001
setopt HIST_EXPIRE_DUPS_FIRST
# AUTOCOMPLETION

# initialize autocompletion
autoload -U compinit && compinit
    '';
  };
}
