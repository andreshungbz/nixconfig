{ den, ... }:
{
  # M1 MacBook Air
  den.hosts.aarch64-darwin.hyena = {
    users = {
      packet = {
        classes = [ "homeManager" ];
      };
    };
  };
}
