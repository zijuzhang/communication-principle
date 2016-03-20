%用plot绘制该信号
N=12;
n=0:2*N-1;
M=4;
x1=sin(2*pi*M*n/N);
plot(n,x1,'color','k');
hold on;
grid on;
M=5;
x2=sin(2*pi*M*n/N);
plot(n,x2,'color','r');
hold on;
grid on;
M=7;
x3=sin(2*pi*M*n/N);
plot(n,x3,'color','g');
hold on;
grid on;
M=10;
x4=sin(2*pi*M*n/N);
plot(n,x4,'color','y');
hold off;
legend('M=4','M=5','M=7','M=10','Location','NorthWest');
%用stem绘制该信号
figure(2);
N=12;
n=0:2*N-1;
M=4;
x1=sin(2*pi*M*n/N);
stem(n,x1,'color','k');
hold on;
grid on;
M=5;
x2=sin(2*pi*M*n/N);
stem(n,x2,'color','r');
hold on;
grid on;
M=7;
x3=sin(2*pi*M*n/N);
stem(n,x3,'color','g');
hold on;
grid on;
M=10;
x4=sin(2*pi*M*n/N);
stem(n,x4,'color','y');
hold off;
legend('M=4','M=5','M=7','M=10','Location','NorthWest');

