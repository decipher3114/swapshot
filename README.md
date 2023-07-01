# swapshot

A simple bash script which combines Gnome-Screenshot + Swappy to make a perfect screenshot and annotation tool for GNOME.

## Dependencies
1. gnome-screenshot(Not the gnome-shell-screenshot)
2. swappy
3. wl-clipboard

## Installation

> ### **Supported Distros** : Arch, Fedora

```
curl -sL "https://raw.githubusercontent.com/decipher3114/swapshot/main/setup.sh" | bash
```

## Default Keybindings

### Swapshot Gnome Keybindings
| Key     | Mode               |
|---------|--------------------|
| Alt + F | FullScreen Mode    |
| Alt + S | Selected Area Mode |
| Alt + W | Window Mode        |

### Swappy 
| Key      | Mode                  |
|----------|-----------------------|
| Ctrl + C | Copy                  |
| Ctrl + S | Save (Default Action) |
| q or Esc | Exit with Saving      |
| [Check all keybindings here](https://github.com/jtheoof/swappy#keyboard-shortcuts) |


## Usage

1. Run swapshot with any key. Select region, if needed.
2. Swappy opens. Annotate the image.
3. Copy to clipboard or simply exit.
> The image will be saved by default to "**$HOME/Screenshots**" folder.