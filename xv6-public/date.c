#include "types.h"
#include "user.h"
#include "date.h"

int
main(int argc, char *argv[])
{
struct rtcdate r;

if (date(&r)) {
printf(2, "date failed\n");
exit();
}
printf(1, "month%d-day%d year%d hour%d:minute%d:second%d\n", 
r.month, r.day, r.year, r.hour, r.minute, r.second);
exit();
}