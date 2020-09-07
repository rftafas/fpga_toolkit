# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  ipgui::add_param $IPINST -name "clock_mode" -widget comboBox
  set ADDR_BYTE_NUM [ipgui::add_param $IPINST -name "ADDR_BYTE_NUM"]
  set_property tooltip {Number of bytes for the AXI Master side.} ${ADDR_BYTE_NUM}
  ipgui::add_param $IPINST -name "CPOL"
  ipgui::add_param $IPINST -name "CPHA"
  ipgui::add_param $IPINST -name "ID_WIDTH"
  ipgui::add_param $IPINST -name "ID_VALUE"
  ipgui::add_param $IPINST -name "DATA_BYTE_NUM"
  ipgui::add_param $IPINST -name "serial_num_rw"

}

proc update_PARAM_VALUE.ADDR_BYTE_NUM { PARAM_VALUE.ADDR_BYTE_NUM } {
	# Procedure called to update ADDR_BYTE_NUM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADDR_BYTE_NUM { PARAM_VALUE.ADDR_BYTE_NUM } {
	# Procedure called to validate ADDR_BYTE_NUM
	return true
}

proc update_PARAM_VALUE.CPHA { PARAM_VALUE.CPHA } {
	# Procedure called to update CPHA when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CPHA { PARAM_VALUE.CPHA } {
	# Procedure called to validate CPHA
	return true
}

proc update_PARAM_VALUE.CPOL { PARAM_VALUE.CPOL } {
	# Procedure called to update CPOL when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CPOL { PARAM_VALUE.CPOL } {
	# Procedure called to validate CPOL
	return true
}

proc update_PARAM_VALUE.DATA_BYTE_NUM { PARAM_VALUE.DATA_BYTE_NUM } {
	# Procedure called to update DATA_BYTE_NUM when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_BYTE_NUM { PARAM_VALUE.DATA_BYTE_NUM } {
	# Procedure called to validate DATA_BYTE_NUM
	return true
}

proc update_PARAM_VALUE.ID_VALUE { PARAM_VALUE.ID_VALUE } {
	# Procedure called to update ID_VALUE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID_VALUE { PARAM_VALUE.ID_VALUE } {
	# Procedure called to validate ID_VALUE
	return true
}

proc update_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to update ID_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ID_WIDTH { PARAM_VALUE.ID_WIDTH } {
	# Procedure called to validate ID_WIDTH
	return true
}

proc update_PARAM_VALUE.clock_mode { PARAM_VALUE.clock_mode } {
	# Procedure called to update clock_mode when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.clock_mode { PARAM_VALUE.clock_mode } {
	# Procedure called to validate clock_mode
	return true
}

proc update_PARAM_VALUE.serial_num_rw { PARAM_VALUE.serial_num_rw } {
	# Procedure called to update serial_num_rw when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.serial_num_rw { PARAM_VALUE.serial_num_rw } {
	# Procedure called to validate serial_num_rw
	return true
}


proc update_MODELPARAM_VALUE.CPOL { MODELPARAM_VALUE.CPOL PARAM_VALUE.CPOL } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CPOL}] ${MODELPARAM_VALUE.CPOL}
}

proc update_MODELPARAM_VALUE.CPHA { MODELPARAM_VALUE.CPHA PARAM_VALUE.CPHA } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CPHA}] ${MODELPARAM_VALUE.CPHA}
}

proc update_MODELPARAM_VALUE.ID_WIDTH { MODELPARAM_VALUE.ID_WIDTH PARAM_VALUE.ID_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID_WIDTH}] ${MODELPARAM_VALUE.ID_WIDTH}
}

proc update_MODELPARAM_VALUE.ID_VALUE { MODELPARAM_VALUE.ID_VALUE PARAM_VALUE.ID_VALUE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ID_VALUE}] ${MODELPARAM_VALUE.ID_VALUE}
}

proc update_MODELPARAM_VALUE.ADDR_BYTE_NUM { MODELPARAM_VALUE.ADDR_BYTE_NUM PARAM_VALUE.ADDR_BYTE_NUM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADDR_BYTE_NUM}] ${MODELPARAM_VALUE.ADDR_BYTE_NUM}
}

proc update_MODELPARAM_VALUE.DATA_BYTE_NUM { MODELPARAM_VALUE.DATA_BYTE_NUM PARAM_VALUE.DATA_BYTE_NUM } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_BYTE_NUM}] ${MODELPARAM_VALUE.DATA_BYTE_NUM}
}

proc update_MODELPARAM_VALUE.serial_num_rw { MODELPARAM_VALUE.serial_num_rw PARAM_VALUE.serial_num_rw } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.serial_num_rw}] ${MODELPARAM_VALUE.serial_num_rw}
}

proc update_MODELPARAM_VALUE.clock_mode { MODELPARAM_VALUE.clock_mode PARAM_VALUE.clock_mode } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.clock_mode}] ${MODELPARAM_VALUE.clock_mode}
}

