# My NixOS configuration
### Introduction...
Some time ago, I started using **NixOS** and noticed one thing: most **"dotfiles"** and **"rices"** for the system were very confusing and complex, featuring fancy window managers, tons of packages, and custom themes. None of that suited me. I needed a simple and straightforward configuration: **KDE Plasma** and a couple of utilities. So, I decided to write my own configuration from scratch. Everything presented here reflects my personal software preferences and my vision of an **"Ideal System!"** In each `.nix` file, I left comments for newcomers who want to use my configuration. If you're an experienced user checking out my efforts, I'm sincerely glad to see you too! If you like this configuration or want to save it for yourself, click the **"Star"** button — it will help me develop this small project 
**:)**

**I don't consider this to be some kind of serious *rice*, just a comfort configuration for beginners.**

## System information
This configuration uses a variety of tools for *declarative system deployment*, starting with `Lix`, which replaces the system *CppNix*, and terminating with the description of some components via **home-manager**. It includes *flakes* that enable certain modules, similar to **plasma-manager** (coming soon).

Boot is performed via `systemd-boot`, but I've left the commented lines for **GRUB** and *OSProber* for dual-booting with Windows or another Linux distribution. All you need to do is uncomment the lines related to **GRUB**.

The default greeter is KDE's `Plasma Login`. The desktop environment is `KDE Plasma`, accordingly.

Home-manager is used to describe the interactive shell, fish, and the beautiful fastfetch autostart. All of this is written in *Nix*, without a single line of QML or other programming languages.

I use various software for my work:
* `KDE Partition Manager` for disk management.
* `KDE Connect` for connecting with phone or other PC.
* `Arc` and `unzip` for archive file.
* `KdenLive` for video editing.
* `VLC` and `Haruna` for multimedia.
* `OBS Studio` for screen recording.
* `Telegram Desktop` and `Vesctop` for social networking.
* `Chromium` for internet browser.
* `LibleOffice` for office.
* `PrismLauncher` for Minecraft.
* `Steam` for other games.
* `Wiregard` for proxy.
## Repository Structure
Each part of the main `configuration.nix` is divided into separate parts located in `/modules/system/`. This is done to simplify access to system settings for the user, drivers, sound, etc. 
## Install
### Before install installation
This configuration was written for a PC that is *extremely* Linux-unfriendly. This means it includes **Nvidia** drivers. If you have a computer with **AMD** or *other* graphics card, you'll need to comment out the `./modules/system/nvidia`.nix line in the import parameters in `configuration.nix` and write the configuration for your graphics card.
If you have a *BIOS*, we recommend using **GRUB**. Simply comment out the *systemd-boot* lines, uncomment the **GRUB** parameters in `boot.nix`, and set all the necessary parameters.
### Installation from sources
### After installation