// `include "yapp_env.sv"
class router_tb extends uvm_env;
    `uvm_component_utils(router_tb)
    yapp_env yapp_e;
    

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    function void start_of_simulation_phase(uvm_phase phase);
        `uvm_info(get_type_name(), "Now in the start of simulation phase for tb", UVM_HIGH)        
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Create the yapp_env instance
        yapp_e = yapp_env::type_id::create("yapp_e", this);
        
        `uvm_info("ROUTER_TB", "Build phase of router_tb is being executed", UVM_HIGH)
    endfunction
endclass //router_tb extends uvm_env