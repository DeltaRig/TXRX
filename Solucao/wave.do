onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/DUT/reset
add wave -noupdate /tb/DUT/clock
add wave -noupdate -expand /tb/DUT/address
add wave -noupdate -expand /tb/DUT/palavra
add wave -noupdate -expand /tb/DUT/req
add wave -noupdate -expand /tb/DUT/grant
add wave -noupdate -expand /tb/DUT/send
add wave -noupdate -expand /tb/DUT/busy
add wave -noupdate -expand /tb/DUT/linha
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {350 ns}