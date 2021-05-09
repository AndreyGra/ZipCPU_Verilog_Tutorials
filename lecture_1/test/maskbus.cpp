#include <stdio.h>
#include <stdlib.h>
#include "Vmaskbus.h"
#include "verilated.h"

int main(int argc, char **argv) {
    Verilated::commandArgs(argc, argv);

    Vmaskbus *tb = new Vmaskbus;

    for(int k=0; k < 20; k++){
        tb->i_sw = k & 0x1ff;
        tb->eval();

        // Now  let’s print  our  results
        printf("k = %2d, ", k);
        printf("sw = %3x, ", tb->i_sw);
        printf("led = %3x\n", tb->o_led);

    }

    return 0;
}