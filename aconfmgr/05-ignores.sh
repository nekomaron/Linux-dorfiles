# Nix ストア全体(home-manager 管理下、aconfmgr の対象外)
IgnorePath '/nix/*'

# pacman のローカルDB(大量の小ファイル)
IgnorePath '/var/lib/pacman/local/*'

# systemd journal ログ
IgnorePath '/var/log/journal/*'

# ソケットファイル(gnupg, nix daemon)
IgnorePath '/etc/pacman.d/gnupg/S.*'
IgnorePath '/nix/var/nix/daemon-socket/socket'

# 巨大バイナリ(カーネル、initramfs など。パッケージ管理下なので中身の追跡は不要)
IgnorePath '/boot/vmlinuz-linux'
IgnorePath '/boot/EFI/Linux/arch-linux.efi'
IgnorePath '/usr/lib/udev/hwdb.bin'
