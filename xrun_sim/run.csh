#!/bin/csh

source ~/cshrc

xrun -access +rwc -uvm -f ../task1_integ/tb/file.f \
    +UVM_TESTNAME=yapp_012_seq_test \
    -top tb_top \
    -log_xmelab xmelab.log \
    -log_xmsim xmsim.log \
    -timescale 1ns/1ns \
    +SVSEED=random \
    +UVM_VERBOSITY=UVM_FULL # -gui