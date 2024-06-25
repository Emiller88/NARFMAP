{...}: {
  perSystem = {pkgs, ...}: let
    cargoToml = builtins.fromTOML (builtins.readFile ./Cargo.toml);
    crateName = cargoToml.package.name;
  in {
    # declare projects
    nci.projects.${crateName}.path = ./.;
    # configure crates
    nci.crates.${crateName} = {
      drvConfig = {
        mkDerivation = {
          buildInputs = [
            pkgs.boost
            pkgs.gnumake
            pkgs.gtest
            pkgs.zlib
          ];
        };

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
    };
  };
}
