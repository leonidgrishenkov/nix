# Install nix

```sh
curl -L https://nixos.org/nix/install | sh
```

To ensure that the necessary environment variables are set, either log in again, or type:

```sh
. /home/yc-user/.nix-profile/etc/profile.d/nix.sh
```

# Enable flake feature

Create config folder:

```sh
mkdir -p ~/.config/nix
```

Create configurations file with flakes enabled:

```sh
cat << EOF >> ~/.config/nix/nix.conf
experimental-features = nix-command flakes
build-users-group = nixbld
EOF
```

# Use flake

Add flake configuration.

```sh
git clone https://github.com/leonidgrishenkov/nix ~/code/nix
```

`cd` into required flake:

```sh
cd ~/code/nix/flake-1
```

Apply:

```sh
nix develop
```
