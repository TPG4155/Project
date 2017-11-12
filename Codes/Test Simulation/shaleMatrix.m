function matrix = shaleMatrix(Lx, Ly, lambdax, lambday, a)
matrix = ones(Ly,Lx);
%% deg = 0

if a == 0
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2))+1 && j == round((Ly/2) - (lambday/2)) %finding top left corner
                for k = i:lambdax+i-1
                    for m = j:lambday+j-1
                        matrix(k,m) = 0;
                    end
                end
                matrix(:,1:2) = 0;
                matrix(:,end-1:end) = 0;
                return
            end
        end
    end
end


%% deg = 5

if a == 5
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2)) %finding bottom left corner
                q = 1;
                k = j;
                n = ones(1,Lx);
                n(12:12:end) = 0;
                while lambdax >= 0
                    for l = k:-1:k-lambday+1
                        matrix(i,l) = 0;
                    end
                    if n(q) == 0
                        k = k - 1; 
                    end
                    i = i + 1;
                    q = q + 1;
                    lambdax = lambdax - 1;
                end
            end
        end
    end
end

%% deg = 10

if a == 10
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2)) %finding bottom left corner
                q = 1;
                k = j;
                n = ones(1,Lx);
                n(6:6:end) = 0;
                while lambdax >= 0
                    for l = k:-1:k-lambday+1
                        matrix(i,l) = 0;
                    end
                    if n(q) == 0
                        k = k - 1; 
                    end
                    i = i + 1;
                    q = q + 1;
                    lambdax = lambdax - 1;
                end
            end
        end
    end
end

%% deg = 15

if a == 15
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2))+3 %finding bottom left corner
                q = 1;
                k = j;
                n = ones(1,Lx);
                n(3:3:end) = 0;
                while lambdax >= 0
                    for l = k:-1:k-lambday+1
                        matrix(i,l) = 0;
                    end
                    if n(q) == 0
                        k = k - 1; 
                    end
                    i = i + 1;
                    q = q + 1;
                    lambdax = lambdax - 1;
                end
            end
        end
    end
end

%% deg = 30

if a == 30
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2))+8 %finding bottom left corner
                q = 1;
                k = j;
                n = ones(1,Lx);
                n(1:7:end) = 0;
                n(3:7:end) = 0;
                n(5:7:end) = 0;
                n(7:7:end) = 0;
                while lambdax >= 0
                    for l = k:-1:k-lambday+1
                        matrix(i,l) = 0;
                    end
                    if n(q) == 0
                        k = k - 1; 
                    end
                    i = i + 1;
                    q = q + 1;
                    lambdax = lambdax - 1;
                end
            end
        end
    end
end

%% deg = 45

if a == 45
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2))+20 %finding bottom left corner
                while lambdax >= 0
                    for l = j:-1:j-lambday+1
                        matrix(l,i) = 0;
                    end
                    i = i + 1;
                    j = j - 1;
                    lambdax = lambdax - 1;
                end
                return
            end
        end
    end
end
                
%% deg = 60

if a == 60
    for i = 1:Lx
        for j = 1:Ly
            if i == round((Lx/2) - (lambdax/2)) && j == round((Ly/2) + (lambday/2)) %finding bottom left corner
                q = 1;
                k = j;
                n = ones(1,Lx);
                n(1:7:end) = 0;
                n(3:7:end) = 0;
                n(5:7:end) = 0;
                n(7:7:end) = 0;
                while lambdax >= 0
                    for l = k:-1:k-lambday+1
                        matrix(i,l) = 0;
                    end
                    if n(q) == 0
                        k = k - 1; 
                    end
                    i = i + 1;
                    q = q + 1;
                    lambdax = lambdax - 1;
                end
            end
        end
    end
end
%%

matrix(:,1:2) = 0;
matrix(:,end-1:end) = 0;


end
