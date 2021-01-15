function probe = registerProbe2Head(probe, headvol, refpts)

[optconn, anchor_pts] = spring2posprobe(probe, refpts, headvol);
posprobe_data = gen_positionprobe_dat(probe.optpos, optconn, anchor_pts);
if isempty(posprobe_data)
    return;
end
optpos_reg = positionprobe(posprobe_data, ...
                           [1 2 3], ...
                           1, ...
                           [0 0 0], ...
                           headvol.img, ...
                           headvol.center, ...
                           400);
% Shed dummy points                      
probe.optpos_reg  = optpos_reg;
probe.orientation = headvol.orientation;