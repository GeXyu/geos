#include "monitor.h"
int kernel_init()
{
    monitor_clear();
    monitor_write("Hello, world!");
    return 0;
}
