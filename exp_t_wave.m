clc
clear all
close all
sig = load('/home/guest/e0103m.mat')
sig = sig.val(1,:)
plot(sig)
hold on 
R_loc = [47, 268, 499, 750, 1000, 1256, 1500, 1758, 2019, 2262]
for k =1:size(R_loc)(1,2)+1
    RR_i = 217/250 % RR intravel value
    R_i = R_loc(k)/250 % location of corresponding R peak where we need to find T
    sr = 250 % sampling rate
    [t1,t2,t3,t4] = scan_window(RR_i, R_i, sr) 
    [to,te, area, dur] = area_under_curve(sig, t1, t2, t3, t4)
    plot(to, sig(to), 'x', 'LineWidth',8)
    plot(te, sig(te), 'o', 'LineWidth',8)
    plot(R_i*250, sig(round(R_i*250)), '+', 'LineWidth',8)
endfor

