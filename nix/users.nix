{ config, pkgs, ... }:
{
  users.users.alex = {
    isNormalUser = true;
    description = "Alex";
    # initialPassword = "1234";
    extraGroups = [ "networkmanager" "wheel" ];
    # shell = pkgs.fish;
    packages = with pkgs; [];
  };
}