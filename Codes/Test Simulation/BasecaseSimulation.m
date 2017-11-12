x = zeros(50);
x(:,3:end-2) = 1;
x(end-1:end,:) = 0;
AnimateSimulate(x)
x = circleMatrix(50,50);
x(end-1:end,:) = 0;
AnimateSimulate(x)
x = wallShaleMatrix(50,50,20,1,0);
x(end-1:end,:) = 0;
AnimateSimulate(x)
x = shaleMatrix(50,50,20,1,30);
x(end-1:end,:) = 0;
AnimateSimulate(x)