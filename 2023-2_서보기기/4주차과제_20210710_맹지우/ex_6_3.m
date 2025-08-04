% ���� 6.3) 5kVA, 208V, 4��, 60Hz, ���� �ἱ�� 3�� ����⿡�� ������ �Ǽ� ������ �����ϰ�
%           ���� ���� ���п��� ���� �����Ͻ��� 8�� �̴�.
%           ���⼭, ������ 3�� 208V, 60Hz�� �߻��ϴ� ������μ� �����Ѵ�.

clear all

kVA = 5*10^3;
Vt = 208;
Phase = 3;
PF = 0.8;
Reacrtance = 8;

% (a) ����Ⱑ 0.8 ���� ������ ���� kVA�� ������ �� ���� ���а� ���°��� ���Ͽ���.
%     �� ���ǿ��� ���̼����� �׷���.
VtPhase = Vt/sqrt(Phase); % 120V / ��
Iareal = kVA/(Vt*sqrt(Phase)); % ���� kVA���� ������ ����
Iaseta = acos(PF);
Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta));
Ef = VtPhase + Ia * Reacrtance * 1i;
Efreal = abs(Ef);  % ���� ���� ���
theta2 = angle(Ef);  
Efdeg = rad2deg(theta2); % ���°�(��Ÿ) ���
fprintf("_______________________________________________________________________________\n")
fprintf('(a)�� ��: ���� ���� E_f�� %.2f, ���°� ��Ÿ�� + %.2f���̴�.\n', Efreal, Efdeg)


% (b) ���� ���� ������ 20% ������ ����, ������ ����, ���� �� ���κ��� ���޵Ǵ� ��ȿ kVA�� ���Ͽ���.
Eget = 1 + 0.2;
N_Ef_real = Efreal*Eget; % ���ο� ���� ���� ���
a = sin(theta2)*Efreal/N_Ef_real;
delta_prime = asin(a);
delta_prime_deg = rad2deg(delta_prime);
N_Ef = complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime));
Ia2 = (N_Ef-VtPhase)/(Reacrtance*1i);
Ia2real = abs(Ia2);  % ������ ���� ũ�� ���
theta3 = angle(Ia2);  % ������ ���� ���� ���
Ia2deg = rad2deg(theta3);
PF2 = cos(-theta3); % ���� ���
Q = 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3; % ��ȿ ���� ���
fprintf('(b)�� ��: ��ȿ kVA�� ���ϸ� %.2f�̴�.\n', Q)

% (c) (a)������ ������ ���� ������ ������ ���� �����Ѵ�. ���� ������ �Ѱ�� ���ΰ�?
% �̷��� �ִ� ���� ���� ���ǿ��� ������(��, ������) ����, ���� �� ��ȿ ������ ���ΰ�?
Pmax = 3*Efreal*VtPhase/Reacrtance; % �ִ� ���� ���� ��
Ia3 = (Efreal*1i-VtPhase)/(Reacrtance*1i);
Ia3real = abs(Ia3); % ������ ���� ���
theta4 = angle(Ia3); % ������ ���� ����
PF3 = cos(theta4);  % ���� ���
Ia4 = sqrt((Efreal^2+VtPhase^2)/Reacrtance^2);
theta5 = atan(VtPhase/Efreal);
PF4 = cos(theta5);
fprintf('(c)�� ��: ������ ������ %.2f�̰�, ������ %.2f�̴�.\n', Ia3real, PF3)
fprintf("_______________________________________________________________________________\n")

fprintf("_______________�� ����__________________\n")

% ���� 6.3) 3kVA, 200V, 4��, 60Hz, ���� �ἱ�� 3�� ����⿡�� ������ �Ǽ� ������ �����ϰ�
%           ���� ���� ���п��� ���� �����Ͻ��� 10�� �̴�.
%           ���⼭, ������ 3�� 200V, 60Hz�� �߻��ϴ� ������μ� �����Ѵ�.

clear all

kVA = 3*10^3;
Vt = 200;
Phase = 3;
PF = 0.5;
Reacrtance = 10;

% (a) ����Ⱑ 0.5 ���� ������ ���� kVA�� ������ �� ���� ���а� ���°��� ���Ͽ���.
%     �� ���ǿ��� ���̼����� �׷���.
VtPhase = Vt/sqrt(Phase); % 120V / ��
Iareal = kVA/(Vt*sqrt(Phase)); % ���� kVA���� ������ ����
Iaseta = acos(PF);
Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta));
Ef = VtPhase + Ia * Reacrtance * 1i;
Efreal = abs(Ef);  % ���� ���� ���
theta2 = angle(Ef);  
Efdeg = rad2deg(theta2); % ���°�(��Ÿ) ���
fprintf("_______________________________________________________________________________\n")
fprintf('(a)�� ��: ���� ���� E_f�� %.2f, ���°� ��Ÿ�� + %.2f���̴�.\n', Efreal, Efdeg)


% (b) ���� ���� ������ 20% ������ ����, ������ ����, ���� �� ���κ��� ���޵Ǵ� ��ȿ kVA�� ���Ͽ���.
Eget = 1 + 0.2;
N_Ef_real = Efreal*Eget; % ���ο� ���� ���� ���
a = sin(theta2)*Efreal/N_Ef_real;
delta_prime = asin(a);
delta_prime_deg = rad2deg(delta_prime);
N_Ef = complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime));
Ia2 = (N_Ef-VtPhase)/(Reacrtance*1i);
Ia2real = abs(Ia2);  % ������ ���� ũ�� ���
theta3 = angle(Ia2);  % ������ ���� ���� ���
Ia2deg = rad2deg(theta3);
PF2 = cos(-theta3); % ���� ���
Q = 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3; % ��ȿ ���� ���
fprintf('(b)�� ��: ��ȿ kVA�� ���ϸ� %.2f�̴�.\n', Q)

% (c) (a)������ ������ ���� ������ ������ ���� �����Ѵ�. ���� ������ �Ѱ�� ���ΰ�?
% �̷��� �ִ� ���� ���� ���ǿ��� ������(��, ������) ����, ���� �� ��ȿ ������ ���ΰ�?
Pmax = 3*Efreal*VtPhase/Reacrtance; % �ִ� ���� ���� ��
Ia3 = (Efreal*1i-VtPhase)/(Reacrtance*1i);
Ia3real = abs(Ia3); % ������ ���� ���
theta4 = angle(Ia3); % ������ ���� ����
PF3 = cos(theta4);  % ���� ���
Ia4 = sqrt((Efreal^2+VtPhase^2)/Reacrtance^2);
theta5 = atan(VtPhase/Efreal);
PF4 = cos(theta5);
fprintf('(c)�� ��: ������ ������ %.2f�̰�, ������ %.2f�̴�.\n', Ia3real, PF3)
