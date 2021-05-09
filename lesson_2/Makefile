# Project setup
PROJ      = tooslow
BUILD     = ./build
CHIPARCH  = hx1k
CLOCKF 	  = 12
DEVICE    = 1k
FOOTPRINT = tq144

# Files
FILES = top.v 
FILES += src/dimmer.v


.PHONY: all clean burn test

all:$(BUILD)/$(PROJ).bin

$(BUILD)/$(PROJ).bin: $(FILES) Makefile
	# if build folder doesn't exist, create it
	mkdir -p $(BUILD)
	# synthesize using Yosys
	yosys -p "synth_ice40 -top top -blif $(BUILD)/$(PROJ).blif" $(FILES)
	# Place and route using arachne
	arachne-pnr -d $(DEVICE) -P $(FOOTPRINT) -o $(BUILD)/$(PROJ).asc -p pinmap_$(FOOTPRINT).pcf $(BUILD)/$(PROJ).blif
	# Convert to bitstream using IcePack
	icepack $(BUILD)/$(PROJ).asc $(BUILD)/$(PROJ).bin
	# Run timing check
	icetime $(BUILD)/$(PROJ).asc -d $(CHIPARCH) -c $(CLOCKF)

verilator:
	mkdir -p data
	verilator -Wall --cc --exe --build --trace -I=/src -I=/test test/$(filename).cpp src/$(filename).v
	./obj_dir/V$(filename)

trace:
	gtkwave data/$(filename)trace.vcd

burn:
	iceprog $(BUILD)/$(PROJ).bin&

clean:
	rm -rf build
	rm -rf obj_dir


