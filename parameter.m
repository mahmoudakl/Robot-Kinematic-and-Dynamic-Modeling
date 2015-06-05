function [p,t] = parameter(x)
syms pi m1 m2 m3 m4 m5 m6 g d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 l1 l2 l3 l4 l5 l6
syms q1 q2 q3 q4 q5 q6 qp1 qp2 qp3 qp4 qp5 qp6 qpp1 qpp2 qpp3 qpp4 qpp5 qpp6

syms I111 I112 I113 I122 I123 I133 I211 I212 I213 I222 I223 I233 I311 I312 I313 I322 I323 I333 I411 I412 I413 I422 I423 I433 I511 I512 I513 I522 I523 I533 I611 I612 I613 I622 I623 I633

syms Beta

S = [m1, m2, m3, m4, m5, m6, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, l1, l2, l3, l4, l5, l6, I111, I112, I113, ...
    I122, I123, I133, I211, I212, I213, I222, I223, I233, I311, I312, I313, I322, I323, I333, I411, I412, I413, I422, I423, I433, I511, I512, I513, I522, I523, I533, I611, I612, I613, I622, I623, I633];

c = children(x);
t=sym(1);
p=sym(1);
for i=1:length(c)
    if(any(S==c(i)))
        p = p*c(i);
    else
        t = t*c(i);
    end
end
