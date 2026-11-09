{ ... }:
{
  services.tor = {
    enable = true;
    torsocks.enable = true;
    client.enable = true;
    settings = {
      ControlPort = [ 9051 ];
      # EntryNodes = "hashy10G,hashy1111";
      ExcludeExitNodes = "{dk},{fr},{no},{nl},{de}";
      ExcludeNodes = "{us},{uk},{gb},{ca},{au},{nz},{kr},{cn},kaspersky,{??},SlowServer";
      StrictNodes = 1;
    };
  };
}
