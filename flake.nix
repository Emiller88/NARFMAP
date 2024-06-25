{
  description = "Description for the project";

  inputs.nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.*.tar.gz";
  inputs.flake-parts.url = "github:hercules-ci/flake-parts";
  inputs.treefmt-nix.url = "github:numtide/treefmt-nix";

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      flake = {
        # TODO Put your original flake attributes here.
      };
      systems = [
        # systems for which you want to build the `perSystem` attributes
        "x86_64-linux"
        # TODO "aarch64-linux" "x86_64-darwin" "aarch64-darwin"
      ];
      perSystem = {
        config,
        pkgs,
        ...
      }: {
        #
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            boost
            gnumake
            gtest
            zlib
          ];

          env = {
            BOOST_INCLUDEDIR = "${pkgs.lib.getDev pkgs.boost}/include";
            BOOST_LIBRARYDIR = "${pkgs.lib.getLib pkgs.boost}/lib";
            GTEST_INCLUDEDIR = "${pkgs.lib.getDev pkgs.gtest}/include";
            GTEST_LIBRARYDIR = "${pkgs.lib.getLib pkgs.gtest}/lib";
            GTEST_ROOT = "${pkgs.gtest}";
            LD_LIBRARY_PATH = "${pkgs.lib.getLib pkgs.gtest}/lib";
            LIBCLANG_PATH = "${pkgs.lib.getLib pkgs.llvmPackages.libclang.lib}/lib";
          };
        };

        packages.dragen = pkgs.stdenv.mkDerivation {
          pname = "NARFMAP";
          version = "1.4.0";

          src = ./.;

          buildInputs = [
            pkgs.boost
            pkgs.gnumake
            pkgs.gtest
            pkgs.zlib
          ];

          buildPhase = ''
            make
          '';

          installPhase = ''
            mkdir -p $out/bin
            cp build/release/compare $out/bin
            cp build/release/dragen-os $out/bin
          '';

          env = {
            BOOST_INCLUDEDIR = "${pkgs.lib.getDev pkgs.boost}/include";
            BOOST_LIBRARYDIR = "${pkgs.lib.getLib pkgs.boost}/lib";
            GTEST_INCLUDEDIR = "${pkgs.lib.getDev pkgs.gtest}/include";
            GTEST_LIBRARYDIR = "${pkgs.lib.getLib pkgs.gtest}/lib";
            GTEST_ROOT = "${pkgs.gtest}";
            LD_LIBRARY_PATH = "${pkgs.lib.getLib pkgs.gtest}/lib";
            LIBCLANG_PATH = "${pkgs.lib.getLib pkgs.llvmPackages.libclang.lib}/lib";
          };

          meta = with pkgs.lib; {
            homepage = "https://github.com/nixvital/nix-based-cpp-starterkit";
            description = ''
              A template for Nix based C++ project setup.";
            '';
            licencse = licenses.mit;
            platforms = with platforms; linux ++ darwin;
            maintainers = [maintainers.breakds];
          };
        };
        treefmt.config = {
          projectRootFile = "flake.nix";

          programs.alejandra.enable = true;
          programs.clang-format.enable = true;
          programs.deadnix.enable = true;
          programs.prettier.enable = true;
          programs.prettier.settings = {
            editorconfig = true;
            embeddedLanguageFormatting = "auto";
          };
        };
      };
    };
}
