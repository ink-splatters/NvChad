{
  description = "Description for the project";

  inputs = {
    flake-parts.inputs.nixpkgs.follows = "nixpkgs";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit self; } {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule

      ];
      systems = nixpkgs.lib.systems.flakeExposed; 
      perSystem = { config, self', inputs', pkgs, system,  ... }: {
        
	buildInputs = with pkgs; [
		neovim
		git
		nixpkgs-fmt
		(pkgs.nerdfonts.override { fonts = [ "FiraCode" "Hack" ]; })
		
	];

	apps.default = let inherit system; in {
			
		default = let inherit system; in
			 

		nixpkgs-fmt
	};

    };
}
