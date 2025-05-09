#! /usr/bin/tclsh
package require -exact Tcl 9.0.0

# Load the Tk package (required when using tclsh for GUI)
package require Tk

# Create a button in the main window
button .btn1 -text "Click Me!" -command {
    tk_messageBox -message "Hello from Tcl!"
}
pack .btn1

