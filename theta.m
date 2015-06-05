clear
clc

syms pi m1 m2 m3 m4 m5 m6 g d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 l1 l2 l3 l4 l5 l6
syms q1 q2 q3 q4 q5 q6 qp1 qp2 qp3 qp4 qp5 qp6 qpp1 qpp2 qpp3 qpp4 qpp5 qpp6

syms I111 I112 I113 I122 I123 I133 I211 I212 I213 I222 I223 I233 I311 I312 I313 I322 I323 I333 I411 I412 I413 I422 I423 I433 I511 I512 I513 I522 I523 I533 I611 I612 I613 I622 I623 I633

syms Beta


id = fopen('tao1.txt');
tao1 = fscanf(id,'%s');
tao1_sym = sym(tao1);
tao1_children = children(tao1_sym);

status ='tao1'
for i=1:length(tao1_children)
    [t1(i),c1(i)] = parameter(tao1_children(i));
    i
end
t1 = unique(t1);


id = fopen('tao2.txt');
tao2 = fscanf(id,'%s');
tao2_sym = sym(tao2);
tao2_children = children(tao2_sym);

status ='tao2'
for i=1:length(tao2_children)
    [t2(i),c2(i)] = parameter(tao2_children(i));
    i
end
t2 = unique(t2);


id = fopen('tao3.txt');
tao3 = fscanf(id,'%s');
tao3_sym = sym(tao3);
tao3_children = children(tao3_sym);

status ='tao3'
for i=1:length(tao3_children)
    [t3(i),c3(i)] = parameter(tao3_children(i));
    i
end
t3 = unique(t3);



id = fopen('tao4.txt');
tao4 = fscanf(id,'%s');
tao4_sym = sym(tao4);
tao4_children = children(tao4_sym);

status ='tao4'
for i=1:length(tao4_children)
    [t4(i),c4(i)] = parameter(tao4_children(i));
    i
end
t4 = unique(t4);



id = fopen('tao5.txt');
tao5 = fscanf(id,'%s');
tao5_sym = sym(tao5);
tao5_children = children(tao5_sym);

status ='tao5'
for i=1:length(tao5_children)
    [t5(i),c5(i)] = parameter(tao5_children(i));
    i
end
t5 = unique(t5);


id = fopen('tao6.txt');
tao6 = fscanf(id,'%s');
tao6_sym = sym(tao6);
tao6_children = children(tao6_sym);

status = 'tao6'
for i=1:length(tao6_children)
    [t6(i),c6(i)] = parameter(tao6_children(i));
    i
end
t6 = unique(t6);

t = [t1, t2, t3, t4, t5, t6];
t = unique(t);

id = fopen('theta.txt','w');
s = sprintf(char(t));
fprintf(id,s);

id = fopen('c1.txt', 'w');
s = sprintf(char(c1));
fprintf(id, s);

id = fopen('c2.txt', 'w');
s = sprintf(char(c2));
fprintf(id, s);

id = fopen('c3.txt', 'w');
s = sprintf(char(c3));
fprintf(id, s);

id = fopen('c4.txt', 'w');
s = sprintf(char(c4));
fprintf(id, s);

id = fopen('c5.txt', 'w');
s = sprintf(char(c5));
fprintf(id, s);

id = fopen('c6.txt', 'w');
s = sprintf(char(c6));
fprintf(id, s);