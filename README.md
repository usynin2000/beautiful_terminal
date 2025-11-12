# How to make your terminal beautiful


| Terminal       | Speed | Setup              | Convenience        | Features                     |
| -------------- | :---: | ------------------ | ------------------ | ---------------------------- |
| macOS Terminal |   🐢  | 🔧 Simple          | 🙂 Easy            | Basic, stable                |
| iTerm2         |   ⚡️  | ⚙️ Highly flexible | 👍 Powerful        | Many pro features            |
| Alacritty      |   🚀  | 🧱 Via YAML        | 😐 Minimalistic    | GPU-based, lightweight, fast |
| Warp           |   ⚡️  | 🎨 Minimal setup   | 🤖 Very convenient | AI, blocks, modern UX        |


## Install iTerm2
1. Download iTerm2 from: https://iterm2.com/index.html
2. Open iTerm2


## Using Zsh and Oh My Zsh

> Zsh (Z Shell) — is a command-line shell.

It’s an alternative to the standard bash that:

- is more modern and convenient;

- supports autocompletion, syntax highlighting, flexible configuration, and plugins;

- comes preinstalled on macOS (starting from Catalina).

In simple terms, Zsh is what takes your commands and shows you the result.

> Oh My Zsh — is a framework built on top of Zsh.

It’s a configuration framework for Zsh that:
- adds themes,
- includes plugins (for example, git, docker, pip, python, nvm, etc.),
- makes it easier to manage your .zshrc file.

Without Oh My Zsh, you’d have to manually define functions, aliases, colors, and so on.
With Oh My Zsh, everything’s ready — you just pick what you need.



| Feature                                           | Without Oh My Zsh | With Oh My Zsh      |
| ------------------------------------------------- | ----------------- | ------------------- |
| Command and error highlighting                    | ❌                 | ✅                   |
| Autocompletion for paths, commands, and options   | 🔸 partially      | ✅                   |
| Convenient prompt (Git branch, status, path)      | ❌                 | ✅                   |
| Plugins (git, docker, python, pip, history, etc.) | ❌                 | ✅                   |
| Themes                                            | ⚙️ manual setup   | 🎨 dozens of themes |
| Settings in one file (~/.zshrc)                   | 🔧 manual         | 👍 automated        |


Download Oh My Zsh with this command:
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
⌘ + T
```

You wiil have nice and clean theme that you have chosen.


> Do not forget to look at your terminal in IDE you use, some themes doesn't look good. My personal minimalistic choise is "fletcherm".



## Adding pluguins

Now when we have beutiful terminal we also could make it more smart.

We will add 3 most useful pluguins. 

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

Add pluguin in .zshrc file to use it, then reload terminal:
```shell
# open ~/.zshrc
plugins=(git zsh-autosuggestions)
# ⌘ + T
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

Add pluguin in .zshrc file to use it, then reload terminal:
```shell
# open ~/.zshrc
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
# ⌘ + T
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
# ⌘ + T
```