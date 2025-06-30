module tb_top;
    // import the UVM library
    // include the UVM macros
    import uvm_pkg::*;
    `include "uvm_macros.svh"

    // import the YAPP package
    import yapp_pkg::*;
    `include "router_tb.sv"
    `include "router_test_lib.sv"

    hw_top hw_top_inst();
    // yapp_vif_config::get(this, "", "vif", vif)) begin

    initial begin
    yapp_vif_config::set(null, "uvm_test_top.tb.yapp_e.tx_agent.*", "vif", hw_top_inst.in0);
        run_test();
    end

endmodule : tb_top
