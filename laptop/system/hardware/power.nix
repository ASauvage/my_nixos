{ ... }:

{
    services.power-profiles-daemon.enable = true;
    services.upower = {
        enable = true;
        percentageLow = 20;
        percentageCritical = 5;
        percentageAction = 3;
        criticalPowerAction = "Hibernate";
    };
}