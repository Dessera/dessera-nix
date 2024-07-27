{ writeTextFile }:
writeTextFile {
  name = "xilinx-ftdi-usb-udev";
  destination = "/etc/udev/rules.d/52-xilinx-ftdi-usb.rules";
  text = ''
    ACTION=="add", ATTR{idVendor}=="0403", ATTR{manufacturer}=="Xilinx", MODE:="666"
  '';
}
