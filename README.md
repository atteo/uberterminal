# Terminal Setup for Programmers

Configures Kitty, Fish, Git and more in a way suitable for programmers.

Every developer is a distinct person with different habits and so such a configuration must be very opinionated by its nature.
That said I think there are some common grounds on which typical programmer configuration can be built upon.

## Installation

* Make sure you run Ubuntu OS.
* Clone this repository.
* Run setup.sh script from the repository root directory to install entire configuration or run setup.sh script for specific tool instead.

## Features
### Modern replacement for common commands

* cat - [bat](https://github.com/sharkdp/bat) with ability to show graphics
* cd - [zoxide](https://github.com/ajeetdsouza/zoxide)
* cp - [xcp](https://github.com/tarka/xcp)
* curl - [curlie](https://github.com/rs/curlie)
* df - [duf](https://github.com/muesli/duf)
* dig - [dog](https://github.com/ogham/dog)
* ls - [exa](https://the.exa.website/)
* top - [btop](https://github.com/aristocratos/btop)
* kubectl - [kubecolor](https://kubecolor.github.io/)
* watch - [hwatch](https://github.com/blacknon/hwatch)

### Fish shell shortcuts

* Alt-p - execute current command and pipe result to `less`
* Alt-w - prefix current command with `watch` and re-execute it
* Alt-f - find file by name
* Alt-g - find file by content
* Shift-Alt-p - find process id

### Various

* Use [Kitty](https://sw.kovidgoyal.net/kitty/) as a default terminal emulator
* Configure [Nerd fonts](https://www.nerdfonts.com/) for extra glyphs
* Use [Fish](https://fishshell.com/) as a default shell with [nice prompt](https://github.com/oh-my-fish/theme-bobthefish), [search engine](https://github.com/PatrickF1/fzf.fish) and some [productivity](https://github.com/franciscolourenco/done) [tools](https://github.com/oh-my-fish/plugin-thefuck)

## How does this work?
Modern terminals provide much more than just text rendering:

* [Support for shortcut keys](https://sw.kovidgoyal.net/kitty/keyboard-protocol/)
* [Graphics](https://sw.kovidgoyal.net/kitty/graphics-protocol/)
* [Desktop notifications](https://sw.kovidgoyal.net/kitty/desktop-notifications/)
* [Mouse cursor shapes](https://sw.kovidgoyal.net/kitty/pointer-shapes/)
