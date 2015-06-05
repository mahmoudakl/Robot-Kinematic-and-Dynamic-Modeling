clear
clc

syms pi m1 m2 m3 m4 m5 m6 g d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 l1 l2 l3 l4 l5 l6
syms q1 q2 q3 q4 q5 q6 qp1 qp2 qp3 qp4 qp5 qp6 qpp1 qpp2 qpp3 qpp4 qpp5 qpp6

syms I111 I112 I113 I122 I123 I133 I211 I212 I213 I222 I223 I233 I311 I312 I313 I322 I323 I333 I411 I412 I413 I422 I423 I433 I511 I512 I513 I522 I523 I533 I611 I612 I613 I622 I623 I633

syms Beta

S = [pi, m1, m2, m3, m4, m5, m6, g, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, l1, l2, l3, l4, l5, l6, I111, I112, I113, ...
    I122, I133, I211, I212, I213, I222, I233, I311, I312, I313, I322, I323, I333, I411, I412, I413, I422, I423, I433, I511, I512, I513, I522, I523, I533, I611, I612, I613, I622, I623, I633, ...
    Beta];

id = fopen('theta.txt');
theta = fscanf(id,'%s');
theta_sym = sym(theta);

id = fopen('c.txt');
coefficients = fscanf(id,'%s');
coefficients = sym(coefficients);

id = fopen('tao1.txt');
tao1 = fscanf(id,'%s');
tao1_sym = sym(tao1);
tao1_children = children(tao1_sym);
x1 = tao1_children;

id = fopen('tao2.txt');
tao2 = fscanf(id,'%s');
tao2_sym = sym(tao2);
tao2_children = children(tao2_sym);
x2 = tao2_children;

id = fopen('tao3.txt');
tao3 = fscanf(id,'%s');
tao3_sym = sym(tao3);
tao3_children = children(tao3_sym);
x3 = tao3_children;

id = fopen('tao4.txt');
tao4 = fscanf(id,'%s');
tao4_sym = sym(tao4);
tao4_children = children(tao4_sym);
x4 = tao4_children;

id = fopen('tao5.txt');
tao5 = fscanf(id,'%s');
tao5_sym = sym(tao5);
tao5_children = children(tao5_sym);
x5 = tao5_children;

id = fopen('tao6.txt');
tao6 = fscanf(id,'%s');
tao6_sym = sym(tao6);
tao6_children = children(tao6_sym);
x6 = tao6_children;

id = fopen('c1.txt');
c1 = fscanf(id,'%s');
c1 = sym(c1);

id = fopen('c2.txt');
c2 = fscanf(id,'%s');
c2 = sym(c2);

id = fopen('c3.txt');
c3 = fscanf(id,'%s');
c3 = sym(c3);

id = fopen('c4.txt');
c4 = fscanf(id,'%s');
c4 = sym(c4);

id = fopen('c5.txt');
c5 = fscanf(id,'%s');
c5 = sym(c5);

id = fopen('c6.txt');
c6 = fscanf(id,'%s');
c6 = sym(c6);


tao = [tao1_sym;tao2_sym;tao3_sym;tao4_sym;tao5_sym;tao6_sym];

Y1 = zeros(1,length(theta_sym));
Y1 = sym(Y1);
for i=1:length(x1)
    p = parameter(x1(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y1(f(j)) = Y1(f(j))+c1(i);
    end
    i
end

Y2 = zeros(1,length(theta_sym));
Y2 = sym(Y2);
for i=1:length(x2)
    p = parameter(x2(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y2(f(j)) = Y2(f(j))+c2(i);
    end
    i
end

Y3 = zeros(1,length(theta_sym));
Y3 = sym(Y3);
for i=1:length(x3)
    p = parameter(x3(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y3(f(j)) = Y3(f(j))+c3(i);
    end
    i
end

Y4 = zeros(1,length(theta_sym));
Y4 = sym(Y4);
for i=1:length(x4)
    p = parameter(x4(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y4(f(j)) = Y4(f(j))+c4(i);
    end
    i
end

Y5 = zeros(1,length(theta_sym));
Y5= sym(Y5);
for i=1:length(x5)
    p = parameter(x5(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y5(f(j)) = Y5(f(j))+c5(i);
    end
    i
end

Y6 = zeros(1,length(theta_sym));
Y6 = sym(Y6);
for i=1:length(x6)
    p = parameter(x6(i));
    f = find(theta_sym==p);
    for j=1:length(f)
        Y6(f(j)) = Y6(f(j))+c6(i);
    end
    i
end


id = fopen('y1.txt','w');
s =sprintf(char(Y1));
fprintf(id,s);
id = fopen('y2.txt','w');
s =sprintf(char(Y2));
fprintf(id,s);
id = fopen('y3.txt','w');
s =sprintf(char(Y3));
fprintf(id,s);
id = fopen('y4.txt','w');
s =sprintf(char(Y4));
fprintf(id,s);
id = fopen('y5.txt','w');
s =sprintf(char(Y5));
fprintf(id,s);
id=fopen('y6.txt','w');
s = sprintf(char(Y6));
fprintf(id,s);

Y = [Y1;Y2;Y3;Y4;Y5;Y6];
theta = transpose(theta_sym);

tao_new = Y*theta;
tao_new = expand(tao_new);
test = tao - tao_new
