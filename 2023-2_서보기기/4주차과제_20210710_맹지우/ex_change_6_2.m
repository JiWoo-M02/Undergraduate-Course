clear all
format short;
S = 20*10^6; %피상전력
 V =40*10^3;% 상전압
 Phase=3 ;%3상
 Vb= V/sqrt(Phase); %선간 전압
Ib=S/(sqrt(Phase)*V) ; % P=VI
Zb=Vb/Ib; % 임피던스 옴의공식 사용

IrA=[100,150,200,250,300,350];
KV=[9.0,12.0,14.0,15.3,15.9,16.4];




% x와 y 데이터를 사용하여 유사한 함수 구하기
% 예를 들어 다항식 적합을 사용할 수 있습니다.
degree = 3; % 다항식의 차수 설정
p = polyfit(IrA, KV, degree); % 다항식 적합 수행

% 적합된 함수로 x 범위 내에서 예측값 생성
x_pred = IrA(1):IrA(6);,0:max(KV); % 예측할 x 범위 설정
y_pred = polyval(p, x_pred); % 예측값 생성

% 원래 데이터와 적합된 함수를 그래프로 그리기

plot(IrA, KV, 'o', x_pred, y_pred, '-');
legend('원래 데이터', '적합된 함수');
xlabel('If 축');
ylabel('kV 축');
title('데이터 적합과 예측');

X0=0;
Y0=0;
hold on

slope = (KV(1) - Y0) / (IrA(1) - X0);

% y절편 (y-intercept) 계산
y_intercept = - slope * X0;

% 직선의 x 범위 설정 (예: -1부터 6까지)
x_range = 0:1:IrA(6);

% 직선 방정식 계산
y_line = slope * x_range + y_intercept;

% 그래프 그리기
plot(x_range, y_line, '--'); % 직선을 실선으로 그립니다.

%{a}반

Vunsat=18000/sqrt(Phase) ;%단락회로 전압
Iunsat=490;        %단락회로 전류
Zunsat=Vunsat/Iunsat %단락회로 인피던스

Relc=0.04 %w전기자 저항

Xunsat= sqrt(Zunsat^2 - Relc^2)


XunsatPu= Xunsat/Zb  % pu

%Ra는 매우 작으므로 그림으로 부터

Zsat=V/sqrt(Phase)/Iunsat 
Xsat=sqrt(Zsat^2 - Relc^2)

XsatPu=Xsat/Zb  %Pu



%{b}
Vtseta=0
Vtreal=1
Vt = complex(Vtreal*cos(Vtseta),Vtreal*sin(Vtseta))  

PF=0.6;
seta=acos(PF);

Iaseta=-seta;
Iareal=1
Ia = complex(Iareal*cos(Iaseta),Iareal*sin(Iaseta))


Zsseta=atan(Xsat/Relc)  
Zsreal=XsatPu;
Zs = complex(Zsreal*cos(Zsseta),Zsreal*sin(Zsseta))

Ef= Vt+Ia*Zs



% 크기 (r) 계산
EfrealPu = abs(Ef);

% 각도 (θ) 계산
theta = angle(Ef);
Efdeg=rad2deg(theta)

Efreal=EfrealPu*V
fprintf('극 좌표: r = %.4f, θ = %.2f도\n', Efreal, Efdeg);

% 발전기 동작이므로 Efdeg 는 양수이고 23.99도임
If=EfrealPu*200 %값 바꿀때 200 여기도 바꿔야됨
%(c) 이건 실선 그래프에서 If값 찍어서 나오는값 하면 됩니다

figure


quiver(0, 0, real(Vt), imag(Vt), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on; % Hold the plot to add the current phasor

% Plot the current phasor
quiver(0, 0, real(Ia), imag(Ia), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on;

% Plot the voltage phasor
quiver(0.9, 0, real(Ia*Zs), imag(Ia*Zs), 'm', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on; % Hold the plot to add the current phasor

% Plot the current phasor
quiver(0, 0, real(Ef), imag(Ef), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on;

% Set axis limits for a clear diagram
axis equal;
axis([-1.5 1.5 -1.5 1.5]);

% Add labels and a legend
xlabel('Real Axis');
ylabel('Imaginary Axis');
title('Phasor Diagram');
legend('Vt', 'Ia', 'Ia*Zs', 'Ef');

% Show the grid
grid on;

    % Hold off to end the plot
    hold off;