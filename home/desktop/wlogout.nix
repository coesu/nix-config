{
  pkgs,
  lib,
  ...
}: {
  programs.wlogout = {
    enable = true;

    style = ''
      window {
          font-family: BlexMono Nerd Font;
          font-size: 13pt;
          color: #ebdbb2; /* text */
          background-color: rgba(40, 40, 40, 0.76);
      }

      button {
          background-repeat: no-repeat;
          background-position: center;
          min-width: 20px;
          min-height: 20px;
          padding: 5px;
          border-style: solid;
          border-radius: 4px;
          border-width: 2px;
          border-color: #ebdbb2;
          background-color: rgba(40, 40, 40, 0.76);
          margin: 10px;
          transition:
              box-shadow 0.3s ease-in-out,
              background-color 0.3s ease-in-out;
      }

      button:hover {
          background-color: rgba(104, 157, 106, 0.92);
          color: #282828;
      }

      button:focus {
          background-color: #ebdbb2;
          color: #282828;
      }
    '';
  };
}
