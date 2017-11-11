function simulate(M)
clf
tic
%% Define Important Variables
% Initial Pressure
pi = 400;

% Number of Active Points (NAP) and Total NAP
[MI,B] = addBoundry(M);
[ny,nx]=size(M);                            % Number of Spacial Steps
NAP = sum(MI');
TNAP = sum(NAP);
TP = (nx-2)*(ny-2);
%M = M+B;

% Flow Property
K = 10;

% Initial Pressure Map
P0 = (MI+B)*pi;
B = B*pi;
% po = pi*ones(TNAP,1); % Må endre den til å være vektor av alle punktene i midten
u = P0(2:end-1,2:end-1)';
po = u(:);
% Spacial and Time Intervals
Lx = 30;                                    % Distance in x Direction
h = Lx/nx;                                  % Spacial Step Size
Ly = h*ny;                                  % Distance in y Direction

Tau =   50;                                 % Total Simulation Time
dt = 0.01;                                % Time Step
nt = Tau/dt;                                % Number of Time Steps

% Pre-Allocating Pressure Matrix
P = ones(ny,nx,nt).*P0;
%% Run Simulation
r = K*dt/h^2;                               % Constant in FD process
[T,Q,b] = makeMatrix5(M,B,r,nx,ny);
toc
tic
TQ = T\Q;
toc
tic
Tb = T\b;
toc
tic
Tb = full(Tb);
TQ = full(TQ);
for k = 2:nt+1                            % Simulation Main Loop
    po = TQ*po+Tb;
    P(2:end-1,2:end-1,k) = reshape(po,[nx-2,ny-2])';
end
toc

%% Animation
    imagesc(P(:,:,1))
    colorbar()
    hold on
    pause()
for i = 2:10:nt+1
    pause(0.1)
    title(['Time' num2str(i*dt)])
    imagesc(P(:,:,i))
end
toc
end