function AnimateSimulate(M)
clf
%% Define Important Variables
% Initial Pressure
pi = 400;

% Number of Active Points (NAP) and Total NAP
[MI,B] = addBoundry(M);
[ny,nx]=size(M);

% Flow Property
K = 50;

% Initial Pressure Map
P0 = (MI+B)*pi;
B = B*pi;
u = P0(2:end-1,2:end-1)';
po = u(:);
% Spacial and Time Intervals
Lx = 50;                                % Distance in x Direction
h = Lx/nx;                              % Spacial Step Size
Ly = h*ny;                              % Distance in y Direction
Tau =   12;                             % Total Simulation Time
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
end

%% Animation
figure(1)
    imagesc(P(:,:,1))
    c = colorbar();
    ylabel(c,'Pressure [bar]')          % Labeling the colorbar
    xlabel('Distance in x-axis')
    ylabel('Distance in y-axis')
    hold on
    pause()
for i = 2:10:nt+1                        % Pressure plot
    pause(0.05)
    title(['Time' num2str(i*dt)])
    imagesc(P(:,:,i))
end
end