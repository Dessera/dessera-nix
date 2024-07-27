{ writeTextFile }:
writeTextFile {
  name = "xilinx-dilligent-usb-udev";
  destination = "/etc/udev/rules.d/52-xilinx-digilent-usb.rules";
  text = ''
    ATTR{idVendor}=="1443", MODE:="666"
    ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Digilent", MODE:="666"
  '';
}
