# PortalFetch 🍰

_This is a fork of [Portalfetch by ArgSliver](https://github.com/ArgSliver/portalfetch)_

> _"I'm making a note here: HUGE SUCCESS."_

Portalfetch is a custom bash wrapper for fastfetch that mirrors the Aperture Science terminal from the end credits of Portal 1.

Unlike standard fastfetch configs that break ASCII borders when system information changes length, this calculates and locks the grid in place to make sure it stays in the boxes.

![PortalFetch Screenshot](portalfetchss.png)

## Features

- **Static Layout:** Replicates the exact dual-pane structure of the Portal end credits.
- **Unbreakable Borders:** Uses a custom rendering script so dynamic data (like changing RAM or Uptime) never misaligns the ASCII walls.
- **Randomized Quotes:** Features a built in database of quotes from classic games (Portal, Half-Life, Halo) and tech figures. Pulls a new quote every time you run it.
- **Powered by Fastfetch:** Fast, lightweight, and uses your existing Fastfetch backend to grab accurate system stats.

### Added in this fork

- **All ASCII art of the credits:** Includes all the ASCII art _Portal 1_ ending. By default, the script randomly select a logo. You can also pick one manually with `-l` flag. [Credits of the ASCII art.](https://blog.kazitor.com/2014/12/portal-ascii/)
- **Fix `Terminal` field:** fastfetch was detecting the script itself as the terminal. Now the `portalfetch` script reads environment variables and climbs the process tree to identify the current terminal.
- **Show TTY device:** Displays the current TTY device (e.g. `/dev/pts/1`) using the `tty` command, useful for identifying your active session.

## About custom logos

You can select a specific logo from the [`./logos`](./logos/) folder, or add your own as `.txt` files in that directory.

To select a logo, use the `-l` or `--logo` flag with the filename (no extension):

```bash
# Example
portalfetch -l cake
```

## Prerequisites

You must have fastfetch installed on your system before running this.
See: https://github.com/fastfetch-cli/fastfetch on how to install it on your system

## Installation

Clone the repository and run the install script:

```bash
git clone https://github.com/50512/portalfetch.git
cd portalfetch
chmod +x install.sh
./install.sh
```
