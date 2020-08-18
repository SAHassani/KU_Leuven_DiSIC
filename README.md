# VHDL_based Linear Digital Self-interference Canceller ( > 30 dB)
---------
Please contact [Networked Systems Group](https://www.esat.kuleuven.be/telemic/research/NetworkedSystems) for
* Non-linear digital self-interference canceller.
* Radar-capable IBFD system.

## Source code
Available as a [Xilinx Vivado 2018.3](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2018-3.html) project.
* Main VHDL code : 
    *"Project_Folder\KUL_DiSIC.srcs\sources_1\new\TOP.vhd"
* Dependencies: 
    *  "Project_Folder\KUL_DiSIC.srcs\sources_1\new\KUL_pkg.vhd"
    *  "Project_Folder\KUL_DiSIC.srcs\sources_1\new\fixed_pkg_c.vhd"
* Testbench: 
    * "Project_Folder\KUL_DiSIC.srcs\sim_1\new\TB.vhd"
* Test Datasets:
    * Simulated dataset: "ProjectFolder\TestData\SimulatedData.txt"
    * Measured IEEE802.11p: "ProjectFolder\TestData\IEEE802_11_p.txt"
## Requirements
For test configuration see "EvaluationSDRSetup.png".
## Contact persons
* Seyed Ali Hassani, KU Leuven, seyedali.hassani@kuleuven.be, syedalihasani@gmail.com
* Sofie Pollin, KU Leuven, sofie.pollin@esat.kuleuven.be
## License and copyright
© Networked Systems Group, KU Leuven, Belgium.
Licensed under [MIT License](LICENSE).