clear all
format short;
S = 20*10^6; %�ǻ�����
 V =40*10^3;% ������
 Phase=3 ;%3��
 Vb= V/sqrt(Phase); %���� ����
Ib=S/(sqrt(Phase)*V) ; % P=VI
Zb=Vb/Ib; % ���Ǵ��� ���ǰ��� ���

IrA=[100,150,200,250,300,350];
KV=[9.0,12.0,14.0,15.3,15.9,16.4];




% x�� y �����͸� ����Ͽ� ������ �Լ� ���ϱ�
% ���� ��� ���׽� ������ ����� �� �ֽ��ϴ�.
degree = 3; % ���׽��� ���� ����
p = polyfit(IrA, KV, degree); % ���׽� ���� ����

% ���յ� �Լ��� x ���� ������ ������ ����
x_pred = IrA(1):IrA(6);,0:max(KV); % ������ x ���� ����
y_pred = polyval(p, x_pred); % ������ ����

% ���� �����Ϳ� ���յ� �Լ��� �׷����� �׸���

plot(IrA, KV, 'o', x_pred, y_pred, '-');
legend('���� ������', '���յ� �Լ�');
xlabel('If ��');
ylabel('kV ��');
title('������ ���հ� ����');

X0=0;
Y0=0;
hold on

slope = (KV(1) - Y0) / (IrA(1) - X0);

% y���� (y-intercept) ���
y_intercept = - slope * X0;

% ������ x ���� ���� (��: -1���� 6����)
x_range = 0:1:IrA(6);

% ���� ������ ���
y_line = slope * x_range + y_intercept;

% �׷��� �׸���
plot(x_range, y_line, '--'); % ������ �Ǽ����� �׸��ϴ�.

%{a}��

Vunsat=18000/sqrt(Phase) ;%�ܶ�ȸ�� ����
Iunsat=490;        %�ܶ�ȸ�� ����
Zunsat=Vunsat/Iunsat %�ܶ�ȸ�� ���Ǵ���

Relc=0.04 %w������ ����

Xunsat= sqrt(Zunsat^2 - Relc^2)


XunsatPu= Xunsat/Zb  % pu

%Ra�� �ſ� �����Ƿ� �׸����� ����

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



% ũ�� (r) ���
EfrealPu = abs(Ef);

% ���� (��) ���
theta = angle(Ef);
Efdeg=rad2deg(theta)

Efreal=EfrealPu*V
fprintf('�� ��ǥ: r = %.4f, �� = %.2f��\n', Efreal, Efdeg);

% ������ �����̹Ƿ� Efdeg �� ����̰� 23.99����
If=EfrealPu*200 %�� �ٲܶ� 200 ���⵵ �ٲ�ߵ�
%(c) �̰� �Ǽ� �׷������� If�� �� �����°� �ϸ� �˴ϴ�

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