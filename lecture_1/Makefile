# Project setup
PROJ      = blinky
BUILD     = ./build
DEVICE    = 1k
FOOTPRINT = tq144

# Files
FILES = top.v

.PHONY: all clean burn test

all:
	# if build folder doesn't exist, create it
	mkdir -p $(BUILD)
	# synthesize using Yosys
	yosys -p "synth_ice40 -top top -blif $(BUILD)/$(PROJ).blif" $(FILES)
	# Place and route using arachne
	arachne-pnr -d $(DEVICE) -P $(FOOTPRINT) -o $(BUILD)/$(PROJ).asc -p pinmap.pcf $(BUILD)/$(PROJ).blif
	# Convert to bitstream using IcePack
	icepack $(BUILD)/$(PROJ).asc $(BUILD)/$(PROJ).bin

verilator:
	verilator -Wall --cc --exe --build -I=/src -I=/test test/$(filename).cpp src/$(filename).v
	./obj_dir/V$(filename)

burn:
	iceprog $(BUILD)/$(PROJ).bin

clean:
	rm -rf build
	rm -rf obj_dir


