function [To, Te, area, dur] = area_under_curve(signal, t1, t2, t3, t4)
  % example [to,te, area, dur] = area_under_curve(signal, t1, t2, t3, t4)
  sr = 250;
  p = 0.016*sr ;% sec;
  w = 0.128*sr; % sec
  to = 0;
  te = 0;
  Te = 0;
  To = 0;
  max_Ao = 0;
  max_Ae = 0;
  % ============ loop for T on =================
  for t = round(t1):round(t2)
    sk = 0;
    for k = (t-p):(t+p)
      sk = sk + signal(k); % signal will be in samples
    endfor
    sk = sk/(2*p + 1);
    
    Ao = 0;
    for k = t:(t+w)
      Ao = Ao + (signal(k) - sk);
    endfor
    
    if max_Ao < Ao
      max_Ao = Ao;
      To = t;
    endif
  endfor
  % ============ loop for T off ================
  for t = round(t3):round(t4)
    sk = 0;
    for k = (t-p):(t+p)
      sk = sk + signal(k); % signal will be in samples
    endfor
    sk = sk/(2*p + 1);
    Ae = 0;
    for k = (t-w):(t)
      Ae = Ae + (signal(k) - sk);
    endfor
    if max_Ae < Ae
      max_Ae = Ae;
      Te = t;
    endif  
  endfor
  Te = round(Te)
  To = round(To)
  area = max_Ae + max_Ao;
  dur = Te - To;
end