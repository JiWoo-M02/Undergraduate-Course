clear all
S=12*10^3
Vt=208
Phase=3;
PF =0.8;
Reacrot=20;


%(1)
VtPhase= Vt/sqrt(Phase) %=120

%정격 kVA에서 고정자 전류 Ia는
Iareal=S/(Vt*sqrt(Phase))

Iaseta=acos(PF)

Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta)) 

Ef=VtPhase+Ia*Reacrot*1i
% 크기 (r) 계산
Efreal = abs(Ef);
% 각도 (θ) 계산
theta2 = angle(Ef);
Efdeg=rad2deg(theta2)
fprintf('극 좌표: r = %.4f, θ = %.2f도\n', Efreal, Efdeg);
% 이때 동기기는 발전기 동작을 하므로 전력각은 양이되고 페이저도 그림은 (b)와 같음

%(B)
Eget=1+0.2;
N_Ef_real=Efreal*Eget

a=sin(theta2)*Efreal/N_Ef_real
delta_prime=asin(a)
delta_prime_deg=rad2deg(delta_prime)
%고정자 전류는
N_Ef= complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime)) 
Ia2=(N_Ef-VtPhase)/(Reacrot*1i)
% 크기 (r) 계산
Ia2real = abs(Ia2);
% 각도 (θ) 계산
theta3 = angle(Ia2);
Ia2deg=rad2deg(theta3)
fprintf('극 좌표: r = %.4f, θ = %.2f도\n', Ia2real, Ia2deg);
% 이때 동기기는 발전기 동작을 하므로 전력각은 양이도고 페이저도 그림은 (b)와 같음
PF2= cos(-theta3)
Q= 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3



%{C}

Pmax=3*Efreal*VtPhase/Reacrot

Ia3=(Efreal*1i-VtPhase)/(Reacrot*1i)


Ia3real = abs(Ia3);

% 각도 (θ) 계산
theta4 = angle(Ia3);


Ia3deg=rad2deg(theta4)

fprintf('극 좌표: r = %.4f, θ = %.2f도\n', Ia3real, Ia3deg);
% 이때 동기기는 발전기 동작을 하므로 전력각은 양이도고 페이저도 그림은 (b)와 같음

Ia3real %고정자 전류
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