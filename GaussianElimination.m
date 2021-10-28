n = input("number of unknowns n = ");
A = input("elements of Matrix A: ");
X = zeros(n, 1);

for i = 1 : (n-1)
    findp = false;
    for p = i : n
        if A(p,i) ~= 0
            findp = true;
            break
        end
    end
    if findp == false
        fprintf("no unique solution");
        break
    end
    if p ~= i
        A([p,i],:) = A([i,p],:);
    end
    for j = (i+1) : n
        m = A(j,i)/A(i,i);
        for k = i : n
            A(j,k) = A(j,k) - m*A(i,k);
        end
        A(j,n+1)=A(j,n+1) - m*A(i,n+1);
    end
end

X(n) = A(n,n+1)/A(n,n);
for i = (n-1) : -1 : 1
    for j = (i+1) : n
        A(i,n+1) = A(i,n+1) - A(i,j)*X(j);
    end
    X(i) = A(i,n+1)/A(i,i);
end

X