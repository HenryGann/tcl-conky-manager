#! /usr/bin/tclsh
package require -exact Tcl 9.0.0

# Load the Tk package (required when using tclsh for GUI)
package require Tk

wm title . "Conky Config Launcher"

set home $::env(HOME)
set files [glob $home/.config/conky/*/*.conf]
set btn_counter 0
foreach file $files {

    set btn_name ".configBtn_$btn_counter"
    button $btn_name -text $file \
    -command [list apply { {file} {
            catch {exec conky -c $file &}
            tk_messageBox -message "Launching conky config"
        }} $file]
    pack $btn_name
    set btn_counter [expr ($btn_counter + 1)]
}