clear all
S=12*10^3
Vt=208
Phase=3;
PF =0.8;
Reacrot=20;


%(1)
VtPhase= Vt/sqrt(Phase) %=120

%���� kVA���� ������ ���� Ia��
Iareal=S/(Vt*sqrt(Phase))

Iaseta=acos(PF)

Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta)) 

Ef=VtPhase+Ia*Reacrot*1i
% ũ�� (r) ���
Efreal = abs(Ef);
% ���� (��) ���
theta2 = angle(Ef);
Efdeg=rad2deg(theta2)
fprintf('�� ��ǥ: r = %.4f, �� = %.2f��\n', Efreal, Efdeg);
% �̶� ������ ������ ������ �ϹǷ� ���°��� ���̵ǰ� �������� �׸��� (b)�� ����

%(B)
Eget=1+0.2;
N_Ef_real=Efreal*Eget

a=sin(theta2)*Efreal/N_Ef_real
delta_prime=asin(a)
delta_prime_deg=rad2deg(delta_prime)
%������ ������
N_Ef= complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime)) 
Ia2=(N_Ef-VtPhase)/(Reacrot*1i)
% ũ�� (r) ���
Ia2real = abs(Ia2);
% ���� (��) ���
theta3 = angle(Ia2);
Ia2deg=rad2deg(theta3)
fprintf('�� ��ǥ: r = %.4f, �� = %.2f��\n', Ia2real, Ia2deg);
% �̶� ������ ������ ������ �ϹǷ� ���°��� ���̵��� �������� �׸��� (b)�� ����
PF2= cos(-theta3)
Q= 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3



%{C}

Pmax=3*Efreal*VtPhase/Reacrot

Ia3=(Efreal*1i-VtPhase)/(Reacrot*1i)


Ia3real = abs(Ia3);

% ���� (��) ���
theta4 = angle(Ia3);


Ia3deg=rad2deg(theta4)

fprintf('�� ��ǥ: r = %.4f, �� = %.2f��\n', Ia3real, Ia3deg);
% �̶� ������ ������ ������ �ϹǷ� ���°��� ���̵��� �������� �׸��� (b)�� ����

Ia3real %������ ����
PF3=cos(theta4)


Ia4=sqrt((Efreal^2+VtPhase^2)/Reacrot^2)


theta5= atan(VtPhase/Efreal)

PF4=cos(theta5)



quiver(0, 0, real(VtPhase), imag(VtPhase), 'r', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on; % Hold the plot to add the current phasor

% Plot the current phasor
quiver(0, 0, real(Ia), imag(Ia), 'b', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on;

% Plot the voltage phasor
quiver(108, 0, real(Ia*Reacrot*1i), imag(Ia*Reacrot*1i), 'm', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on; % Hold the plot to add the current phasor

% Plot the current phasor
quiver(0, 0, real(Ef), imag(Ef), 'g', 'LineWidth', 2, 'MaxHeadSize', 0.2);
hold on;

% Set axis limits for a clear diagram
axis equal;
axis([-200 200 -200 200]);

% Add labels and a legend
xlabel('Real Axis');
ylabel('Imaginary Axis');
title('Phasor Diagram');
legend('Vt', 'Ia', 'Ia*Zs', 'Ef');

% Show the grid
grid on;

% Hold off to end the plot
hold off;