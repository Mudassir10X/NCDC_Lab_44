// 64 bit option for AWS labs
-64bit

-uvmhome /home/cc/mnt/XCELIUM2309/tools/methodology/UVM/CDNS-1.2

// include directories
//*** add incdir include directories here
-incdir ../router/rtl
-incdir ../sv/
-incdir ../tb/

// compile files
//*** add compile files here
../sv/yapp_pkg.sv
../sv/yapp_if.sv
../tb/clkgen.sv
../tb/top.sv
../router_rtl/yapp_router.sv
../tb/hw_top.sv

