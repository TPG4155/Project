function [T,Q,b] = makeMatrix5(M,B,r,nx,ny)
%% Defining variables
TP = (nx-2)*(ny-2);
%% Preallocating
m=zeros(nx-2,ny-2);
b=zeros(nx-2,ny-2);
%% Making a matrix with number of active neighbors
m(1:end,1:end)=(M(1:end-2,2:end-1)+M(3:end,2:end-1)+M(2:end-1,1:end-2)+M(2:end-1,3:end))';
a = m(:); %Transfering it into a vector
one = -ones(TP-1,1);
one2 = -ones(TP-nx+2,1);
%% Matrix with NAP on diagonal and -1 at 
Tm = diag(a) + diag(one,1) + diag(one,-1) + diag(one2,nx-2) + diag(one2,-nx+2);
M = M(2:end-1,2:end-1)';
MV = M(:); %Transfering the inner points to a vector
Tm = MV.*Tm.*MV'; %Removes the contribution from the passive points
T = sparse(diag(ones(TP,1)) + r*Tm); %LHS in eq TP = Qp+b
Q = sparse(diag(ones(TP,1)) - r*Tm); %RHS
b(1:end,1:end) = (B(1:end-2,2:end-1)+B(3:end,2:end-1)+B(2:end-1,1:end-2)+B(2:end-1,3:end))'.*M;
b = sparse(2*r*b(:)); %RHS
end