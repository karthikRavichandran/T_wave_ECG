function [t1,t2,t3,t4] = scan_window(RR_i, R_i, sr)%RR_i in sec, R_i in sec
%example [t1,t2,t3,t4] = scan_window(217/250, 275/250, 250) 


 if(RR_i < 0.88) %0.88 s
    t1 = 0.05*sqrt(RR_i) + R_i + 0.08
    t2 = 0.15*RR_i + R_i + 0.12
  else
    t1 = 0.05*sqrt(RR_i) + R_i + 0.1
    t2 = R_i + 0.32
  end
  
  if(RR_i < 0.88) %0.88 s
    t3 = 0.15*RR_i + R_i + 0.148
    t4 = 0.7*RR_i + R_i - 0.036
  else
    t3 = R_i + 0.28
    t4 = 0.2*RR_i + R_i + 0.404
  end
  t1 = sr*t1
  t2 = sr*t2
  t3 = sr*t3
  t4 = sr*t4
end