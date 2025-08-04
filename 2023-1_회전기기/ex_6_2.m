clear all
format short;

MVA = 19*10^6;  % �ǻ�����
V = 10*10^3;  % ������
Phase = 3;  % 3��
Vb = V/sqrt(Phase);  % ���� ����
Ib = MVA/(sqrt(Phase)*V) ;  % P = VI
Zb = Vb/Ib; % ���Ǵ��� ���ǰ��� ���


% (a) �� �� pu�� ����ȭ �� ��ȭ ���� �����Ͻ��� ���Ͽ���
Vunsat = 18000/sqrt(Phase);     % �ܶ�ȸ�� ����
Iunsat = 490;                   % �ܶ�ȸ�� ����
Zunsat = Vunsat/Iunsat;         % �ܶ�ȸ�� ���Ǵ���
Relc = 0.08;                     % ������ ����
Xunsat = sqrt(Zunsat^2 - Relc^2);
XunsatPu = Xunsat/Zb;  % ��
Zsat = V/sqrt(Phase)/Iunsat; 
Xsat = sqrt(Zsat^2 - Relc^2);
XsatPu = Xsat/Zb;  % pu
fprintf("_______________________________________________________________________________\n")
fprintf('(a)�� ��: ���� %.2f, pu�� %.2f�̴�.\n', XunsatPu, XsatPu)


% (b) ���� �����Ⱑ ���� ��ǿ� ����Ǿ� �ְ� ���� ���� 0.8�� ���� MVA�� �����Ѵٰ� �� �� �ʿ��� ���� ������ ���Ͽ���
Vtseta = 0;
Vtreal = 1;
Vt = complex(Vtreal*cos(Vtseta),Vtreal*sin(Vtseta));  
PF = 0.8;
seta = acos(PF);
Iaseta = -seta;
Iareal = 1;
Ia = complex(Iareal*cos(Iaseta),Iareal*sin(Iaseta));
Zsseta = atan(Xsat/Relc);
Zsreal = XsatPu;
Zs = complex(Zsreal*cos(Zsseta),Zsreal*sin(Zsseta));
Ef = Vt+Ia*Zs;
EfrealPu = abs(Ef);
theta = angle(Ef);
Efdeg = rad2deg(theta);
Efreal = EfrealPu*V;
If = EfrealPu*200;
fprintf('(b)�� ��: ���������� %.2ff�̴�.\n', If)

% (c) (b)�� ���� �����ϴ� �����⸦ ���� ������ ��ȭ��Ű�� ���� ä�� ���� ��ǿ��� ��� �� ���������� ���Ͽ���

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
