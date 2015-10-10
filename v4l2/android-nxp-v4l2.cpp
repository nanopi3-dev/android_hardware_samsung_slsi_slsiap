#include <android-nxp-v4l2.h>
#include "nxp-v4l2.h"

#ifdef __cplusplus
extern "C" {
#endif

static bool inited = false;
bool android_nxp_v4l2_init()
{
    if (!inited) {
        struct V4l2UsageScheme s;
        memset(&s, 0, sizeof(s));

#ifdef USES_CAMERA_BACK
        s.useClipper0   = true;
        s.useDecimator0 = true;
#else
        s.useClipper0   = false;
        s.useDecimator0 = false;
#endif

#ifdef USES_CAMERA_FRONT
        s.useClipper1   = true;
        s.useDecimator1 = true;
#else
        s.useClipper1   = false;
        s.useDecimator1 = false;
#endif

        s.useMlc0Video  = true;
        s.useMlc1Video  = true;
        s.useMlc1Rgb    = true;

#ifdef USES_HDMI
        s.useHdmi       = true;
#else
        s.useHdmi       = false;
#endif

#ifdef USES_RESOL
        s.useResol      = true;
#else
        s.useResol      = false;
#endif

        int ret = v4l2_init(&s);
        if (ret != 0)
            return false;

        inited = true;
    }
    return true;
}

#ifdef __cplusplus
}
#endif
