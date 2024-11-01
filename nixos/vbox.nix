{
  virtualisation.virtualbox = {
    host.enable = true;
    guest.enable = true;
    guest.dragAndDrop = true;
  };

  users.users.archer.extraGroups = ["vboxusers"];
}
