# Modified from https://github.com/riscv/riscv-tests
.include "riscv_test.h"       # defines the macros (in all-caps)

RVTEST_RV64U                  # define TVM used by program

# Test code
RVTEST_CODE_BEGIN             # Start of test code
        lw      x2, testdata  # load word into x2 (41)
        addi    x2, 1         # add 1 to x2 (our result)
        sw      x2, result    # store word into memory overwriting -1s.
        li      x3, 42        # load immediate into x3 (desired result)
        bne     x2, x3, fail  # branch if not equal: Fail if no match
        RVTEST_PASS           # else success
fail:
        RVTEST_FAIL
RVTEST_CODE_END               # End of test code

# Input data section
# This section is optional, the data is NOT saved in the output
.data
        .align 3
testdata:
        .dword 41

# Output data section
RVTEST_DATA_BEGIN   # Start of test output data region
        .align 3
result:
        .dword -1
RVTEST_DATA_END     # End of test output data region
