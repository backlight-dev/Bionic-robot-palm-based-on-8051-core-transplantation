#
# Create work library
#
vlib work
#
# Compile sources
#
vlog  I:/Version1_6_TDV2/td_proj/simulation/MC8051OnBoard_tb.v
#
# Call vsim to invoke simulator
#
vsim -L  -gui -novopt work.MC8051OnBoard_tb
#
# Add waves
#
add wave *
#
# Run simulation
#
run 1000ns
#
# End