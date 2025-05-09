#! /usr/bin/tclsh
package require -exact Tcl 9.0.0

# Load the Tk package (required when using tclsh for GUI)
package require Tk


set home $::env(HOME)
set files [glob $home/.config/conky/*/*.conf]
set btn_counter 0
foreach file $files {

    set btn_name ".configBtn_$btn_counter"
    button $btn_name -text $file -command [list apply { {file} {
        set status 0
        if {[catch {exec conky -c $file} results options]} {
            set details [dict get $options -errorcode]
            if {[lindex $details 0] eq "CHILDSTATUS"} {
                set status [lindex $details 2]
            } else {
                tk_messageBox -message "That config could not be properly loaded."
            }
        }
    }} $file]

    set btn_counter [expr ($btn_counter + 1)]
    pack $btn_name
}