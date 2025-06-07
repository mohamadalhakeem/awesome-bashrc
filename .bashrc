#!/bin/bash
# ==============================
# 🚀 Optimized .bashrc for HPC environments (e.g. TACC Lonestar 6)
# Template by Koutian Wu (GitHub: ktwu01)
# This file is designed to be a starting point for your zsh configuration.
# It includes essential settings, aliases, and functions to enhance your zsh experience.
# Feel free to customize it further to suit your needs.
# Place this file in your $HOME directory.
# ==============================

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# ---------------------- DIRECTORY PATHS ----------------------
# Replace these with your own directories (export them in your login or profile)
export WORKDIR=${WORKDIR:-"/path/to/your/workdir"}
export SCRATCHDIR=${SCRATCHDIR:-"/path/to/your/scratch"}
export WORKLIB="$WORKDIR/lib"
export WORKBIN="$WORKDIR/bin"

# Create if they don't exist
mkdir -p "$WORKLIB" "$WORKBIN" "$SCRATCHDIR/trash" 2>/dev/null

# ---------------------- AUTO-BACKUP FUNCTION ----------------------
# Keep a local git repo of your .bashrc; commits/pushes only when it changes
export BASHRC_REPO=${BASHRC_REPO:-"$WORKDIR/config_backups/bashrc"}
function sync_bashrc() {
    cp "$HOME/.bashrc" "$BASHRC_REPO/.bashrc"
    cd "$BASHRC_REPO"
    git pull origin main
    if git status --porcelain | grep -q .; then
        git add .
        git commit -m "chore: update bashrc"
        git push
        echo "✔ bashrc pushed"
    else
        echo "✔ no changes"
    fi
    cd - >/dev/null
    source "$HOME/.bashrc"
}
alias sourcebash='sync_bashrc'

# ---------------------- HISTORY SETTINGS ----------------------
unset HISTFILE
HISTSIZE=5000

# ---------------------- GLOBAL DEFINITIONS ----------------------
[ -f /etc/bashrc ] && . /etc/bashrc

# ---------------------- MODULE MANAGEMENT ----------------------
module purge
module load tacc-apptainer
module load intel/19.1.1
module load impi/19.0.9
module load python3/3.9.7

# ---------------------- PATH CONFIGURATION ----------------------
export PATH="$WORKBIN:$WORKLIB/bin:$HOME/.local/bin:$PATH"

# ---------------------- ENVIRONMENT REDIRECTION ----------------------
export PYTHONPATH="$WORKLIB/python:$PYTHONPATH"
export PIP_CACHE_DIR="$WORKLIB/.pip_cache"
export MPLCONFIGDIR="$WORKLIB/.config/matplotlib"
export JUPYTER_CONFIG_DIR="$WORKLIB/.jupyter"
export JUPYTER_RUNTIME_DIR="$WORKLIB/.jupyter/runtime"
export JUPYTER_DATA_DIR="$WORKLIB/.jupyter"
export IPYTHONDIR="$WORKLIB/.ipython"

# ---------------------- LIBRARY PATHS ----------------------
export LIBJASPER="-L${WORKLIB}/jasper -I${WORKLIB}/jasper/include"
export NETCDF="/opt/apps/intel19/netcdf/4.6.2/x86_64"
export NETCDF_INC="$NETCDF/include"
export NETCDF_LIB="$NETCDF/lib"
export CUDA_HOME="/opt/apps/cuda/12.2"

# ---------------------- CONDA CONFIGURATION ----------------------
[ -f "$WORKDIR/miniconda3/etc/profile.d/conda.sh" ] && \
    source "$WORKDIR/miniconda3/etc/profile.d/conda.sh"

# ---------------------- SHELL OPTIONS ----------------------
shopt -s checkwinsize
[ -n "$VSCODE_IPC_HOOK_CLI" ] && export TERM=xterm-256color

# Color prompt
case "$TERM" in
  xterm-color|xterm-256color) color_prompt=yes;; 
esac
if [ "$color_prompt" = yes ]; then
  PS1='\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
else
  PS1='[\u@\h \w]\$ '
fi
unset color_prompt

# ---------------------- ALIASES ----------------------
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias myquota='du -h $WORKDIR --max-depth=1 | sort -hr'
alias workcd='cd $WORKDIR'
alias editbash='code ~/.bashrc'
alias alert='notify-send --urgency=low -i \
  "$( [ $? = 0 ] && echo terminal || echo error )" \
  "$(history|tail -n1|sed -e '\''s/^[ ]*[0-9]\+[ ]*//;s/[;&|][ ]*alert$//'\'')"'

# ---------------------- COMPLETION ----------------------
[ -f /etc/bash_completion ] && . /etc/bash_completion