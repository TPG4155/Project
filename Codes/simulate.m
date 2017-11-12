function simulate(M)
clf
%% Define Important Variables
% Initial Pressure
pi = 400;
% Number of Active Points (NAP) and Total NAP
[MI,B] = addBoundry(M);
[ny,nx]=size(M);
% Flow Property
K = 5;
% Initial Pressure Map 
P0 = (MI+B)*pi;
B = B*pi;
u = P0(2:end-1,2:end-1)';
po = u(:);
% Spacial and Time Intervals
Lx = 30;                                % Distance in x Direction
h = Lx/nx;                              % Spacial Step Size
Ly = h*ny;                              % Distance in y Direction
count = 0;
Tau =   18;                             % Total Simulation Time
dt = 0.01;                              % Time Step
nt = Tau/dt;                            % Number of Time Steps
% Pre-Allocating Pressure Matrix
P = ones(ny,nx,nt).*P0;
%% Run Simulation
r = K*dt/h^2;                           % Constant in FD process
[T,Q,b] = makeMatrix5(M,B,r,nx,ny);
TQ = T\Q;
Tb = T\b;
Tb = full(Tb);                          % Sparse to full matrix
TQ = full(TQ);                          % Sparse to full matrix
for k = 2:nt+1                          % Simulation Main Loop
    po = TQ*po+Tb;
    P(2:end-1,2:end-1,k) = reshape(po,[nx-2,ny-2])';
    if k == floor(1/6*Tau/dt)
        fx1{1} = P(round(ny/3),:,k);
        fx2{1} = P(round(2*ny/3),:,k);
        fx3{1} = P(:,round(nx/3),k);
        fx4{1} = P(:,round(2*nx/3),k);        
    elseif k == floor(1/3*Tau/dt)
        fx1{2} = P(round(ny/3),:,k);
        fx2{2} = P(round(2*ny/3),:,k);
        fx3{2} = P(:,round(nx/3),k);
        fx4{2} = P(:,round(2*nx/3),k);        
    elseif k == floor(1/2*Tau/dt)
        fx1{3} = P(round(ny/3),:,k);
        fx2{3} = P(round(2*ny/3),:,k);
        fx3{3} = P(:,round(nx/3),k);
        fx4{3} = P(:,round(2*nx/3),k); 
    elseif k == floor(2/3*Tau/dt)
        fx1{4} = P(round(ny/3),:,k);
        fx2{4} = P(round(2*ny/3),:,k);
        fx3{4} = P(:,round(nx/3),k);
        fx4{4} = P(:,round(2*nx/3),k); 
    end
end
%% Animation
figure(1)
    imagesc(P(:,:,1))
    c = colorbar();
    ylabel(c,'Pressure [bar]')              % Labeling the colorbar
    xlabel('Distance in x-axis')
    ylabel('Distance in y-axis')
    hold on
    pause()
for i = 2:1:nt+1                            % Pressure plot
    pause(0.01)
    title(['Time' num2str(i*dt)])
    imagesc(P(:,:,i))   
    if i == floor(1/6*Tau/dt)
        pause()
    elseif i == floor(1/3*Tau/dt)
        pause()
    elseif i == floor(1/2*Tau/dt)
        pause()
    elseif i == floor(2/3*Tau/dt)
        pause()
    end 
end
for i = 2:1:nt+1
    if i == floor(1/6*Tau/dt)
        pause()
        figure(2)
        subplot(2,2,1)
        hold on
        grid on
        xlabel('Distance in x-axis')
        ylabel('Pressure [bar]') 
        plot(0:h:Lx-h,fx1{1},'k')
        plot(0:h:Lx-h,fx2{1},'r')
        plot(0:h:Lx-h,fx3{1},'b')
        plot(0:h:Lx-h,fx4{1},'m')
    elseif i == floor(1/3*Tau/dt)
        pause()
        figure(2)
        subplot(2,2,2)
        hold on
        grid on
        xlabel('Distance in x-axis')
        ylabel('Pressure [bar]')
        plot(0:h:Lx-h,fx1{2},'k')
        plot(0:h:Lx-h,fx2{2},'r')
        plot(0:h:Lx-h,fx3{2},'b')
        plot(0:h:Lx-h,fx4{2},'m')
    elseif i == floor(1/2*Tau/dt)
        pause()
        figure(2)
        subplot(2,2,3)
        hold on
        grid on
        xlabel('Distance in x-axis')
        ylabel('Pressure [bar]')  
        plot(0:h:Lx-h,fx1{3},'k')
        plot(0:h:Lx-h,fx2{3},'r')
        plot(0:h:Lx-h,fx3{3},'b')
        plot(0:h:Lx-h,fx4{3},'m')
    elseif i == floor(2/3*Tau/dt)
        pause()
        figure(2)
        subplot(2,2,4)
        hold on
        grid on
        xlabel('Distance in x-axis')
        ylabel('Pressure [bar]')
        plot(0:h:Lx-h,fx1{4},'k')
        plot(0:h:Lx-h,fx2{4},'r')
        plot(0:h:Lx-h,fx3{4},'b')
        plot(0:h:Lx-h,fx4{4},'m')
    end
end
end