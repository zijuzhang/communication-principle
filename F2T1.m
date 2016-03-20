function [m]=F2T1(M,fs)
%-------------------------输入参数
%M：信号的频谱
%fs:系统采样频率
%--------------------输出(返回)参数
%m:傅里叶逆变换后的信号，注意其长度为2的整数次幂，利用其画波形时，要注意选取m
%的一部分，选取长度和所给时间序列t的长度要一致， plot(t,m(1:length(t)))，
%否则会出错。
m = real(ifft(M))*fs;