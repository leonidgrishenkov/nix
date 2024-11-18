{
  description = "Cross platform configurations";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.systems.url = "github:nix-systems/default";

  outputs = { self, nixpkgs, systems }: let
    supportedSystems = nixpkgs.lib.genAttrs (import systems);
    forEachSystem = function: supportedSystems (system:
        function nixpkgs.legacyPackages.${system});
  in {
    devShells = forEachSystem (pkgs: {
      default = pkgs.mkShell {
        packages = [
          pkgs.stylua
          pkgs.luaPackages.luacheck
          pkgs.luajitPackages.vusted
          pkgs.selene
        ];

        # Define environment variables
        shellHook = ''
          export MY_CUSTOM_VARIABLE="my_value"
          export ANOTHER_VARIABLE="another_value"

          # Custom commands to run on shell start
          echo "Welcome to the Neovim LSP dev shell!"
          echo "Setting up environment..."
        '';
      };
    });
  };
}
