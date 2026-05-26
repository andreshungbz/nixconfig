{
  # https://helix-editor.com/
  pkt.helix = {
    homeManager = {
      programs.helix = {
        enable = true;

        settings = {
          editor = {
            color-modes = true;
            cursorcolumn = true;
            cursorline = true;
          };
        };
      };

      home.sessionVariables = {
        EDITOR = "hx";
      };
    };
  };
}
