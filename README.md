# How to make your terminal beautiful

A guide to setting up a modern, fast, and visually appealing terminal on macOS.


| Terminal       | Speed | Setup              | Convenience        | Features                     |
| -------------- | :---: | ------------------ | ------------------ | ---------------------------- |
| macOS Terminal |   🐢  | 🔧 Simple          | 🙂 Easy            | Basic, stable                |
| iTerm2         |   ⚡️  | ⚙️ Highly flexible | 👍 Powerful        | Many pro features            |
| Alacritty      |   🚀  | 🧱 Via YAML        | 😐 Minimalistic    | GPU-based, lightweight, fast |
| Warp           |   ⚡️  | 🎨 Minimal setup   | 🤖 Very convenient | AI, blocks, modern UX        |

> Tip: “Speed” is how fast the terminal feels in daily use. “Setup” indicates ease of installation and configuration. “Convenience” is about user-friendliness. “Features” lists key functionality.

## Recommended Setup Order

1. Install iTerm2

2. Use Zsh as your shell

3. Install Oh My Zsh framework

4. Pick a theme

5. Add useful plugins

## Install iTerm2
Download and install iTerm2 from https://iterm2.com. Open iTerm2 after installation.



## Using Zsh and Oh My Zsh

> Zsh (Z Shell) — a modern command-line shell alternative to bash.

It provides:

- autocompletion, syntax highlighting, and flexible configuration
- preinstalled on macOS (Catalina and later)
- easier command history and scripting

> Oh My Zsh — a framework for managing Zsh configuration.

It’s a configuration framework for Zsh that:
- add themes,
- includes plugins (for example, git, docker, pip, python, nvm, etc.),
- makes it easier to manage your .zshrc file.

Without Oh My Zsh, you would need to manually define aliases, functions, colors, and more. With Oh My Zsh, everything is ready to use — just pick what you need



| Feature                                           | Without Oh My Zsh | With Oh My Zsh      |
| ------------------------------------------------- | ----------------- | ------------------- |
| Command and error highlighting                    | ❌                 | ✅                   |
| Autocompletion for paths, commands, and options   | 🔸 partially      | ✅                   |
| Convenient prompt (Git branch, status, path)      | ❌                 | ✅                   |
| Plugins (git, docker, python, pip, history, etc.) | ❌                 | ✅                   |
| Themes                                            | ⚙️ manual setup   | 🎨 dozens of themes |
| Settings in one file (~/.zshrc)                   | 🔧 manual         | 👍 automated        |


Install Oh My Zsh with this command:
```shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```


Choose a terminal theme you like here: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

Open the .zshrc file:
```
open ~/.zshrc
```

Change theme in file .zshrc: 
```
ZSH_THEME="fletcherm" # your theme here
```


Reload your terminal
```
source ~/.zshrc
```

You will have nice and clean theme that you have chosen.


> Note: Some themes may not render well in your IDE terminal. My personal minimalistic choice is "fletcherm".



## Adding plugins

Now when we have beautiful terminal we also could make it more smart.

We will add 3 most useful plugins. 

- zsh-autosuggestions
- zsh-syntax-highlighting
- z

### zsh-autosuggestions

> It shows command suggestions based on your history.

When you start typing a command, a gray hint appears on the right with something you’ve entered before.

For example, when you write:
```shell
git pu
```

it will more likely hint:
```shell
git push origin master
```

zsh-autosuggestions installation:
```shell
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Add plugin in .zshrc file to use it, then reload terminal:
```shell
# open ~/.zshrc
plugins=(git zsh-autosuggestions)
# source ~/.zshrc
```


###  zsh-syntax-highlighting
> Highlights commands in the terminal, just like in an IDE.

- 🟢 — valid commands
- 🔴 — if the command doesn’t exist
- 🔵 — arguments
- 🟡 — paths

Usecase:
You can immediately see if you made a typo or entered an incorrect path.


zsh-syntax-highlighting installation:
```shell
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Add plugin in .zshrc file to use it, then reload terminal:
```shell
# open ~/.zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source ~/.zshrc
```


### Z
> Lets you quickly jump between directories you’ve already visited.

Example:
```shell
cd /Users/you/Projects/long_project_name
```
→ after that, you can simply type:
```shell
z long
```

Installation:
z is already built into Oh My Zsh — just enable it.
```shell
# open ~/.zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting z)
# source ~/.zshrc
```