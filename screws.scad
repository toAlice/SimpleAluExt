height = 10;
rad = 40;
thread_pitch = 0.7;
linear_extrude(height = height, center = true, convexity = 10,
               twist = height / thread_pitch * 360, $fn = 100)
    translate([ rad / 20, 0, 0 ]) circle(r = rad);