{ pkgs, ... }: {
  programs.firefox = {
    enable = true;
  };

  programs.chromium = {
    enable = true;
  };
  xdg.desktopEntries = {
    chromium-school = {
      name = "Chromium (School)";
      genericName = "Web Browser";
      exec = "chromium --profile-directory=school %U";
      icon = "chromium";
      terminal = false;
      categories = [ "Network" "WebBrowser" ];
      startupNotify = true;
    };
    chromium-work = {
      name = "Chromium (Work)";
      genericName = "Web Browser";
      exec = "chromium --profile-directory=work %U";
      icon = "chromium";
      terminal = false;
      categories = [ "Network" "WebBrowser" ];
      startupNotify = true;
    };
  };
}
