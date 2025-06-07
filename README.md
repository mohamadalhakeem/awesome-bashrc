
<!--## Using the Restoration Function

After your `.bashrc` has been sourced, you can use these commands:

```bash
# List available backups
bashrc_restore list

# Restore the most recent backup
bashrc_restore latest

# Restore a specific backup by timestamp
bashrc_restore 20250505_120000
```
-->

This system ensures you'll never lose important `.bashrc` configurations while also keeping your backup storage organized and efficient. The backups are stored in your `$WORK` directory, which has more space than your home directory.



## What's Included

- VS Code terminal integration
- Enhanced command history settings
- Directory navigation shortcuts
- Git workflow aliases
- Color settings for terminal output
- Local customization support

## Installation

1. Clone this repository:
   ```bash
   git clone https://github.com/ktwu01/awesome-bashrc.git
   ```

2. Create a symbolic link to the .bashrc file:
   ```bash
   ln -sf ~/path/to/repo/.bashrc ~/.bashrc
   ```

3. Restart your terminal or run:
   ```bash
   source ~/.bashrc
   ```

- **Customization**
    
    - Define `$WORKDIR`, `$SCRATCHDIR`, `$BASHRC_REPO`.

<!-- ## Customization

For machine-specific settings, create a `.bashrc.local` file in your home directory. This file will be automatically sourced if it exists.
 -->

## Features

- **VS Code Integration**: Use `code .` to open the current directory in VS Code
- **Navigation**: Use `..`, `...` for faster directory traversal
- **Git Shortcuts**: Current is good enough; you can also use aliases like `gs` for git status, `gp` for git push
- **Directory Shortcuts**: Quick access to commonly used directories.
- **Auto-backup**: Auto-backup via Git, once use the `sourcebash` command.

## Usage Notes
After installation, you'll need to restart your terminal or run `source ~/.bashrc` to apply the changes.

If you make changes to the repository version, remember to push your changes to keep all your machines in sync.

# == BACKUP SYSTEM ==
# Enhanced automatic backup system for .bashrc

0. Clone this repository.

1. Do not use zshhistory. instead, save only a copy to BASHRC_REPO="$WORK/config_backups/bashrc", every time use sourcezsh. and the commit msg is always set to "update". if there is no new zsh content then it will no commit.

2. once use use sourcezsh, commit and push it to githb. that is, embed the "commit and push it to githb" cmd in zsh itself. 

```
BASHRC_REPO="$WORK/config_backups/bashrc"
```