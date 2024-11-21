{
  pkgs,
  lib,
  config,
  ...
}: {
  programs.git = {
    enable = true;
    package = pkgs.gitAndTools.gitFull;
    userName = "coesu";
    userEmail = "something@gmail.com";
    aliases = {};
    extraConfig = {
      init.defaultBranch = "main";
      pull.ff = "only";
    };
    ignores = [
      ".direnv"
      "result"
      ".CondaPkg"
      ".env"
    ];
  };
}
