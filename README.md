# ❄️ My NixOS configuration ❄️
### 😺 Introduction...
Some time ago, I started using **NixOS** and noticed one thing: most **"dotfiles"** and **"rices"** for the system were very confusing and complex, featuring fancy window managers, tons of packages, and custom themes. None of that suited me. I needed a simple and straightforward configuration: **KDE Plasma** and a couple of utilities. So, I decided to write my own configuration from scratch. Everything presented here reflects my personal software preferences and my vision of an **"Ideal System!"** In each `.nix` file, I left comments for newcomers who want to use my configuration. If you're an experienced user checking out my efforts, I'm sincerely glad to see you too! If you like this configuration or want to save it for yourself, click the **"Star"** button – it will help me develop this small project
**:)**

**I don't consider this to be some kind of serious *rice*, just a comfort configuration for beginners.**

## 🖥️ System information
This configuration uses a variety of tools for *declarative system deployment*, starting with `Lix`, which replaces the system *CppNix*, and ending with the description of some components via **home-manager**. It includes *flakes* that enable certain modules, similar to **plasma-manager** (coming soon).

Boot is performed via `systemd-boot`, but I've left the commented lines for **GRUB** and *os-prober* for dual-booting with Windows or another Linux distribution. All you need to do is uncomment the lines related to **GRUB**.

The default greeter is KDE's `Plasma Login`. The desktop environment is `KDE Plasma`, accordingly.

Home-manager is used to describe the interactive shell, fish, and the beautiful fastfetch autostart. All of this is written in *Nix*, without a single line of QML or other programming languages.

I use various software for my work:
* `KDE Partition Manager` for disk management.
* `KDE Connect` for connecting with phone or other PC.
* `Ark` and `unzip` for archive files.
* `Kdenlive` for video editing.
* `VLC` and `Haruna` for multimedia.
* `OBS Studio` for screen recording.
* `Telegram Desktop` and `Vesktop` for social networking.
* `Chromium` for internet browser.
* `LibreOffice` for office.
* `PrismLauncher` for Minecraft.
* `Steam` for other games.
* `WireGuard` for proxy.

## 📑 Repository Structure
Each part of the main `configuration.nix` is divided into separate parts located in `/modules/system/`. This is done to simplify access to system settings for the user, drivers, sound, etc. Home-manager modules follow the same idea, under `/modules/home/`.

```
.
├── flake.nix                    # entry point – change username/hostname here
├── configuration.nix            # imports every module below
├── home.nix                     # imports the home-manager modules
├── hardware-configuration.nix   # not in the repo – generate your own, read "Install"
└── modules/
    ├── system/
    │   ├── boot.nix              # bootloader, kernel
    │   ├── system.nix            # hostname, locale, timezone, Nix and Lix settings
    │   ├── nvidia.nix            # Nvidia driver
    │   ├── audio.nix             # PipeWire
    │   ├── user.nix              # user account, groups
    │   ├── xserver.nix           # Xorg, keyboard layout
    │   ├── desktop.nix           # KDE Plasma 6 + Plasma Login
    │   ├── games.nix             # Steam, gamemode
    │   └── vpn_nix.example       # WireGuard template
    └── home/
        ├── fastfetch.nix
        └── fish.nix
```

## 💽 Install
### Before installation
This configuration was written for a PC that is *extremely* Linux-unfriendly. This means it includes **Nvidia** drivers. If you have a computer with **AMD** or *other* graphics card, you'll need to comment out the `./modules/system/nvidia.nix` line in the import parameters in `configuration.nix` and write the configuration for your graphics card.
If you have a *BIOS*, we recommend using **GRUB**. Simply comment out the *systemd-boot* lines, uncomment the **GRUB** parameters in `boot.nix`, and set all the necessary parameters.

### Installation from sources
1. Boot from the NixOS installer, partition and mount your disk as usual.
2. Generate your own hardware config – this repo doesn't (and can't) ship one for you:
   ```
   nixos-generate-config --root /mnt
   ```
3. Clone this repository into `/mnt/etc/nixos` and drop the `hardware-configuration.nix` you just generated right next to it.
   ```
   git clone https://github.com/krevetka-ural/my-nixos-configuration.git
   mv /my-nixos-configuration/* /mnt/etc/nixos/
   cd /mnt/etc/nixos/
   ```
4. Open `flake.nix` and change `username` and `hostname` – that's the only place you need to touch, every module picks the values up from there.
5. *(Optional)* Want the VPN module? Copy `modules/system/vpn_nix.example` to `modules/system/vpn.nix`, fill in your own WireGuard peer, and uncomment its line in `configuration.nix`'s `imports`.
6. Install the system:
   ```
   nixos-install --root /mnt --flake /mnt/etc/nixos#<hostname>
   ```

### 📄 After installation
Log in and set yourself a real password – `user.nix` ships with a placeholder `initialPassword`, don't keep it:
```
passwd
```
From here on, applying any change to the config is just:
```
sudo nixos-rebuild switch --flake .
```
or use the `rebuild` alias already set up in fish (see `modules/home/fish.nix`) – same thing, fewer keystrokes.

That's it – you're running the same system I do! If any module doesn't fit your hardware or taste, that's exactly what the split-by-topic structure in `/modules/` is for: find the file, change the file, rebuild.
