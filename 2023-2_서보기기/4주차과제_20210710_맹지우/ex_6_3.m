% 예제 6.3) 5kVA, 208V, 4극, 60Hz, 성형 결선의 3상 동기기에서 고정자 권선 저항은 무시하고
%           정격 단자 전압에서 동기 리액턴스는 8옴 이다.
%           여기서, 동기기는 3상 208V, 60Hz를 발생하는 발전기로서 동작한다.

clear all

kVA = 5*10^3;
Vt = 208;
Phase = 3;
PF = 0.8;
Reacrtance = 8;

% (a) 동기기가 0.8 지상 역률로 정격 kVA를 공급할 떄 여자 전압과 전력각을 구하여라.
%     이 조건에서 페이서도를 그려라.
VtPhase = Vt/sqrt(Phase); % 120V / 상
Iareal = kVA/(Vt*sqrt(Phase)); % 정격 kVA에서 고정자 전류
Iaseta = acos(PF);
Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta));
Ef = VtPhase + Ia * Reacrtance * 1i;
Efreal = abs(Ef);  % 여자 전압 계산
theta2 = angle(Ef);  
Efdeg = rad2deg(theta2); % 전력각(델타) 계산
fprintf("_______________________________________________________________________________\n")
fprintf('(a)의 답: 여자 전압 E_f는 %.2f, 전력각 델타는 + %.2f도이다.\n', Efreal, Efdeg)


% (b) 계자 여자 전류가 20% 증가할 때에, 고정자 전류, 역률 및 기기로부터 공급되는 무효 kVA를 구하여라.
Eget = 1 + 0.2;
N_Ef_real = Efreal*Eget; % 새로운 여자 전압 계산
a = sin(theta2)*Efreal/N_Ef_real;
delta_prime = asin(a);
delta_prime_deg = rad2deg(delta_prime);
N_Ef = complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime));
Ia2 = (N_Ef-VtPhase)/(Reacrtance*1i);
Ia2real = abs(Ia2);  % 고정자 전류 크기 계산
theta3 = angle(Ia2);  % 고정자 전류 각도 계산
Ia2deg = rad2deg(theta3);
PF2 = cos(-theta3); % 역률 계산
Q = 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3; % 무효 전류 계싼
fprintf('(b)의 답: 무효 kVA를 구하면 %.2f이다.\n', Q)

% (c) (a)에서의 전류에 대해 원동기 전력이 점차 증가한다. 정태 안정도 한계는 얼마인가?
% 이러한 최대 전력 전달 조건에서 고정자(즉, 전기자) 전류, 역률 및 무효 전력은 얼마인가?
Pmax = 3*Efreal*VtPhase/Reacrtance; % 최대 전력 전달 식
Ia3 = (Efreal*1i-VtPhase)/(Reacrtance*1i);
Ia3real = abs(Ia3); % 고정자 전류 계산
theta4 = angle(Ia3); % 고정자 전류 위상
PF3 = cos(theta4);  % 역률 계산
Ia4 = sqrt((Efreal^2+VtPhase^2)/Reacrtance^2);
theta5 = atan(VtPhase/Efreal);
PF4 = cos(theta5);
fprintf('(c)의 답: 고정자 전류는 %.2f이고, 역률은 %.2f이다.\n', Ia3real, PF3)
fprintf("_______________________________________________________________________________\n")

fprintf("_______________값 변경__________________\n")

% 예제 6.3) 3kVA, 200V, 4극, 60Hz, 성형 결선의 3상 동기기에서 고정자 권선 저항은 무시하고
%           정격 단자 전압에서 동기 리액턴스는 10옴 이다.
%           여기서, 동기기는 3상 200V, 60Hz를 발생하는 발전기로서 동작한다.

clear all

kVA = 3*10^3;
Vt = 200;
Phase = 3;
PF = 0.5;
Reacrtance = 10;

% (a) 동기기가 0.5 지상 역률로 정격 kVA를 공급할 떄 여자 전압과 전력각을 구하여라.
%     이 조건에서 페이서도를 그려라.
VtPhase = Vt/sqrt(Phase); % 120V / 상
Iareal = kVA/(Vt*sqrt(Phase)); % 정격 kVA에서 고정자 전류
Iaseta = acos(PF);
Ia = complex(Iareal*cos(-Iaseta),Iareal*sin(-Iaseta));
Ef = VtPhase + Ia * Reacrtance * 1i;
Efreal = abs(Ef);  % 여자 전압 계산
theta2 = angle(Ef);  
Efdeg = rad2deg(theta2); % 전력각(델타) 계산
fprintf("_______________________________________________________________________________\n")
fprintf('(a)의 답: 여자 전압 E_f는 %.2f, 전력각 델타는 + %.2f도이다.\n', Efreal, Efdeg)


% (b) 계자 여자 전류가 20% 증가할 때에, 고정자 전류, 역률 및 기기로부터 공급되는 무효 kVA를 구하여라.
Eget = 1 + 0.2;
N_Ef_real = Efreal*Eget; % 새로운 여자 전압 계산
a = sin(theta2)*Efreal/N_Ef_real;
delta_prime = asin(a);
delta_prime_deg = rad2deg(delta_prime);
N_Ef = complex(N_Ef_real*cos(delta_prime),N_Ef_real*sin(delta_prime));
Ia2 = (N_Ef-VtPhase)/(Reacrtance*1i);
Ia2real = abs(Ia2);  % 고정자 전류 크기 계산
theta3 = angle(Ia2);  % 고정자 전류 각도 계산
Ia2deg = rad2deg(theta3);
PF2 = cos(-theta3); % 역률 계산
Q = 3*abs(VtPhase)*Ia2real*sin(-theta3)*10^-3; % 무효 전류 계싼
fprintf('(b)의 답: 무효 kVA를 구하면 %.2f이다.\n', Q)

% (c) (a)에서의 전류에 대해 원동기 전력이 점차 증가한다. 정태 안정도 한계는 얼마인가?
% 이러한 최대 전력 전달 조건에서 고정자(즉, 전기자) 전류, 역률 및 무효 전력은 얼마인가?
Pmax = 3*Efreal*VtPhase/Reacrtance; % 최대 전력 전달 식
Ia3 = (Efreal*1i-VtPhase)/(Reacrtance*1i);
Ia3real = abs(Ia3); % 고정자 전류 계산
theta4 = angle(Ia3); % 고정자 전류 위상
PF3 = cos(theta4);  % 역률 계산
Ia4 = sqrt((Efreal^2+VtPhase^2)/Reacrtance^2);
theta5 = atan(VtPhase/Efreal);
PF4 = cos(theta5);
fprintf('(c)의 답: 고정자 전류는 %.2f이고, 역률은 %.2f이다.\n', Ia3real, PF3)
