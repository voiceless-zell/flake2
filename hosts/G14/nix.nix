{ pkgs, inputs, config, ... }:
{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "kvm-amd" ];
  boot.kernel.sysctl = {
  "vm.max_map_count" = 20971520;
  "fs.file-max" = 524288;
};
#boot.initrd.preDeviceCommands = ''
#  DEVS="0000:01:00.0 0000:01:00.1"
#  for DEV in $DEVS; do
#    echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
#  done
#  modprobe -i vfio-pci
#'';
boot.kernelParams = [ "intel_iommu=on" "pcie_aspm=off" ];
boot.initrd.availableKernelModules = [  "vfio-pci"];
  networking = {
    hostName = "G14";
    networkmanager.enable = true;
    firewall.enable = false;
  };
  zramSwap.enable = true;
   services.xserver = {
    enable = true;
    xkb.layout = "us";
   videoDrivers = [  "nvidia"  ];
    desktopManager.gnome = {
        enable = true;
      };
   };
  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
      ];
     };
  };
  services.gvfs.enable = true;
}
