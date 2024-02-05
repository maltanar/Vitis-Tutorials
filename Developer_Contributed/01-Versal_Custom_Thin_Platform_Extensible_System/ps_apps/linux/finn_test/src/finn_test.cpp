//
// Copyright (C) 2023, Advanced Micro Devices, Inc. All rights reserved.
// SPDX-License-Identifier: X11
//
#include <stdlib.h>
#include <fstream>
#include <iostream>
#include <unistd.h>
#include <xrt/xrt_device.h>
#include <xrt/xrt_kernel.h>
#include <experimental/xrt_graph.h>
#include <experimental/xrt_ip.h>
static const char*    STR_PASSED = "PASSED:  ";
static const char*    STR_USAGE  = "USAGE:   ";
int main(int argc, char* argv[]) {
  //TARGET_DEVICE macro needs to be passed from gcc command line
  if(argc != 2) {
    std::cout << STR_USAGE << argv[0] <<" <xclbin>" << std::endl;
    return EXIT_FAILURE;
  }
  char* xclbinFilename = argv[1];
  unsigned int dev_index = 0;
  auto my_device = xrt::device(dev_index);
  std::cout << STR_PASSED << "auto my_device = xrt::device(" << dev_index << ")" << std::endl;
  auto xclbin_uuid = my_device.load_xclbin(xclbinFilename);
  std::cout << STR_PASSED << "auto xclbin_uuid = my_device.load_xclbin(" << xclbinFilename << ")" << std::endl;
  auto my_rtl_ip = xrt::ip(my_device, xclbin_uuid, "instrumentation_wrapper:{instrumentation_wrapper_0}");
  std::cout << STR_PASSED << "auto my_rtl_ip = xrt::ip(my_device, xclbin_uuid, \"instrumentation_wrapper:{instrumentation_wrapper_0}\")" << std::endl;                                                                                                        
  // Start the instrumentation wrapper
  // CFG reg offset 0x10:
  // bit[0] = 1 -> enable lfsr.
  // bit[31:16] = seed
  my_rtl_ip.write_register(0x10, 0x00010003);
  std::cout << "  Writing Config:  " << std::hex << ( my_rtl_ip.read_register(0x10) ) << std::endl;

  for (int i = 0; i < 20; i++) {
    sleep(1);
    std::cout << "Poll instrumentation_wrapper register" << std::endl;
    std::cout << "  Status    :  0x" << std::hex << ( my_rtl_ip.read_register(0x18) ) << std::endl;
    std::cout << "  Latency   :  " << std::dec << ( my_rtl_ip.read_register(0x28) ) << std::endl;
    std::cout << "  Interval  :  " << std::dec << ( my_rtl_ip.read_register(0x38) ) << std::endl;
    std::cout << "  Checksum  :  0x" << std::hex << ( my_rtl_ip.read_register(0x48) ) << std::endl;
  }
  std::cout << STR_PASSED << "my_graph.end()" << std::endl;
  std::cout << std::endl << STR_PASSED << argv[0] << std::endl << std::endl;
}
 
