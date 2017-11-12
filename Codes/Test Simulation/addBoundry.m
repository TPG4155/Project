function [M,B] = addBoundry(M)
B = zeros(size(M));

top = 1/4;
bottom = 1/4;
left = 1/4;
right = 1/4;

B(:,1) = left;
B(1,2:end-1) = top;
B(end,2:end-1) = bottom;
B(:,end) = right;
M(:,1) = 0;
M(1,2:end-1) = 0;
M(end,2:end-1) = 0;
M(:,end) = 0;
end