# UIMotionEffect demo

This is an example project that demonstrates the use of UIMotionEffect within an application, and providing a UIView extension in Swift that makes it easy to configure these effects using
UIAppearance or Interface Builder.

## Interface Builder

When configuring a view in Interface Builder, utilize the motionOffset or shadowMotionOffset properties. When using negative values for width or height, it will automatically invert the
device's gyro response accordingly.  This also includes extra UIAppearance and IBInspectable properties for controlling borders and corner radii to make the demo more compelling.
