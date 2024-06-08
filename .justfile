os:
    sudo nixos-rebuild switch --flake .
up:
    nix flake update
# Update specific input
# Usage: just upp nixpkgs
upp input:
  nix flake update {{input}}

# List all generations of the system profile
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Open a nix shell with the flake
repl:
  nix repl -f flake:nixpkgs

# remove all generations older than 7 days
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Garbage collect all unused nix store entries
gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old


fmt:
  nix fmt

nvim-test:
  rm -rf /home/lars/.config/nvim
  rsync -avz home/core/nvim /home/lars/.config/

nvim-clean:
  rm -rf /home/lars/.config/nvim
