# VHDL_based Linear Digital Self-interference Canceller ( > 30 dB)
---------
Please contact [Networked Systems Group](https://www.esat.kuleuven.be/telemic/research/NetworkedSystems) for
* Non-linear digital self-interference canceller.
* Radar-capable IBFD System.

## Demo Video
https://www.youtube.com/watch?v=mXJouo4y0HY

## Source code
Available as a [Xilinx Vivado 2018.3](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2018-3.html) project.
* Main VHDL code : 
    * "KUL_DiSIC\KUL_DiSIC.srcs\sources_1\new\TOP.vhd"
* Dependencies: 
    *  "KUL_DiSIC\KUL_DiSIC.srcs\sources_1\new\KUL_pkg.vhd"
    *  "KUL_DiSIC\KUL_DiSIC.srcs\sources_1\new\fixed_pkg_c.vhd"
* Testbench: 
    * "KUL_DiSIC\KUL_DiSIC.srcs\sim_1\new\TB.vhd"
* Test Datasets:
    * Simulated dataset: "ProjectFolder\TestData\SimulatedData.txt"
    * Measured IEEE802.11p: "ProjectFolder\TestData\IEEE802_11_p.txt"
* Requirements
    * For test configuration see "EvaluationSDRSetup.png".

## Evaluation and test interface
Available as a [LabVIEW Communications System Design Suite 4.0](https://www.ni.com/en-us/support/downloads/software-products/download.labview-communications-system-design-suite.html#351843) project.
* Main VIs
    * FPGA VI: "LabVIEWcomms4- Tester\FPGA_VI.gcomp\mainFPGA_VI.gvi"
    * HOST VI: "LabVIEWcomms4- Tester\Host\KUL DiSIC Tester_Host.gvi"
* Compatible hardware:
    * [NI USRP 294x](https://www.ni.com/nl-be/support/model.usrp-2942.html)
      * Transmitter port: RF0/Tx1  
      * Receiver port: RF1/Rx2
    * [NI USRP 295x](https://www.ni.com/en-us/support/model.usrp-2953.html)
        * Transmitter port: RF0/Tx1  
        * Receiver port: RF1/Rx2

## Contact persons
* Seyed Ali Hassani, KU Leuven, seyedali.hassani@kuleuven.be, syedalihasani@gmail.com
* Sofie Pollin, KU Leuven, sofie.pollin@esat.kuleuven.be
## License and copyright
© [Networked Systems Group](https://www.esat.kuleuven.be/telemic/research/NetworkedSystems), KU Leuven, Belgium.
Licensed under [MIT License](LICENSE).
