set script_path [ file dirname [ file normalize [ info script ] ] ]

set stdexpert_path $script_path/../../dependencies/stdexpert
foreach lib_path [glob -directory $stdexpert_path -type d *] {
  set hdl_files [glob -nocomplain $lib_path/*.vhd]
  set test_benches [glob -nocomplain $lib_path/*tb.vhd]
  if {[llength $hdl_files] > 0} {
    add_files -norecurse -scan_for_includes $hdl_files
    set_property library expert [get_files $hdl_files]
    set_property file_type {VHDL 2008} [get_files $hdl_files]
    if {[llength $test_benches] > 0} {
      set_property used_in_synthesis false [get_files  $test_benches]
    }
  }
}

#std_blocks
set stdblocks_path $script_path/../../dependencies/stdblocks
foreach lib_path [glob -directory $stdblocks_path -type d *] {
  set hdl_files [glob -nocomplain $lib_path/*.vhd]
  set test_benches [glob -nocomplain $lib_path/*tb.vhd]
  if {[llength $hdl_files] > 0} {
    add_files -norecurse -scan_for_includes $hdl_files
    set_property library stdblocks [get_files $hdl_files]
    set_property file_type {VHDL 2008} [get_files $hdl_files]
    if {[llength $test_benches] > 0} {
      set_property used_in_synthesis false [get_files  $test_benches]
    }
  }
}
