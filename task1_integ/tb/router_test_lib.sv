`include "uvm_macros.svh"
import uvm_pkg::*;

class base_test extends uvm_test;
    `uvm_component_utils(base_test)
    router_tb tb;
    // declare the objection object
    uvm_objection obj;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = router_tb::type_id::create("tb", this);
        uvm_config_wrapper::set(this, "tb.yapp_e.tx_agent.sequencer.run_phase",
                                        "default_sequence",
                                        yapp_5_packets::get_type());
        `uvm_info("BUILD_PHASE", "Executing build_phase of base_test", UVM_HIGH)
        uvm_config_int::set(this, "*", "recording_detail", 1);
    endfunction

    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction

    // run phase
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "Executing run_phase of base_test", UVM_HIGH)
        obj = phase.get_objection();
        obj.set_drain_time(this, 200ns);
    endtask

    function void check_phase(uvm_phase phase);
        super.check_phase(phase);
        `uvm_info("CHECK_PHASE", "Executing check_phase of base_test", UVM_HIGH)
        check_config_usage();
    endfunction

endclass

class test2 extends base_test;
    `uvm_component_utils(test2)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction
    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "Executing run_phase of test2", UVM_HIGH)
        `uvm_info("RUN_PHASE", "Packets sent in test2", UVM_HIGH)
    endtask
endclass

class short_packet_test extends base_test;
    `uvm_component_utils(short_packet_test)
    function new(string name, uvm_component parent);
        super.new(name, parent);
        
    endfunction //new()

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("BUILD_PHASE", "Executing build_phase of short_packet_test", UVM_HIGH)
        uvm_factory::get().set_type_override_by_type(yapp_packet::get_type(), short_yapp_packet::get_type());
    endfunction //build_phase
endclass //short_packet_test extends base_test

class set_config_test extends base_test;
    `uvm_component_utils(set_config_test)
    function new(string name, uvm_component parent);
        super.new(name, parent);        
    endfunction //new()

    function void build_phase(uvm_phase phase);
        uvm_config_int::set(null, "uvm_test_top.tb.yapp_e.tx_agent", "is_active", UVM_PASSIVE);
        // uvm_config_db#(uvm_active_passive_enum)::set(null, "uvm_test_top.tb.yapp_e.tx_agent", "is_active", UVM_PASSIVE);
        super.build_phase(phase);
        `uvm_info("BUILD_PHASE", "Executing build_phase of set_config_test", UVM_HIGH)
        // uvm_factory::get().set_type_override_by_type(yapp_packet::get_type(), set_config_test::get_type());
    endfunction //build_phase
endclass //set_config_test extends base_test

class incr_payload_test extends base_test;
    `uvm_component_utils(incr_payload_test)
    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Set type override for yapp_packet to short_yapp_packet
        uvm_factory::get().set_type_override_by_type(yapp_packet::get_type(), short_yapp_packet::get_type());
        // tb = router_tb::type_id::create("tb", this);
        uvm_config_wrapper::set(this, "tb.yapp_e.tx_agent.sequencer.run_phase",
                                        "default_sequence",
                                        yapp_incr_payload_seq::get_type());
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
        `uvm_info("RUN_PHASE", "Executing run_phase of incr_payload_test", UVM_HIGH)
        `uvm_info("RUN_PHASE", "Packets sent in incr_payload_test", UVM_HIGH)
    endtask
endclass

class exhaustive_seq_test extends base_test;
    `uvm_component_utils(exhaustive_seq_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Set type override for yapp_packet to short_yapp_packet
        uvm_factory::get().set_type_override_by_type(yapp_packet::get_type(), short_yapp_packet::get_type());
        // tb = router_tb::type_id::create("tb", this);
        uvm_config_wrapper::set(this, "tb.yapp_e.tx_agent.sequencer.run_phase",
                                        "default_sequence",
                                        yapp_exhaustive_seq::get_type());
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask
endclass

class yapp_012_seq_test extends base_test;
    `uvm_component_utils(yapp_012_seq_test)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        // Set type override for yapp_packet to short_yapp_packet
        uvm_factory::get().set_type_override_by_type(yapp_packet::get_type(), short_yapp_packet::get_type());
        // tb = router_tb::type_id::create("tb", this);
        uvm_config_wrapper::set(this, "tb.yapp_e.tx_agent.sequencer.run_phase",
                                        "default_sequence",
                                        yapp_012_seq::get_type());
    endfunction

    task run_phase(uvm_phase phase);
        super.run_phase(phase);
    endtask
endclass