# User Configuration

{ pkgs, user, ... }:
{
  users = {
    users.${user.username} = {
      name = user.username;
      home = "/Users/${user.username}";
      isHidden = false;
      shell = pkgs.zsh;
    };
  };
}
