clear
clc

syms pi m1 m2 m3 m4 m5 m6 g d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 l1 l2 l3 l4 l5 l6
syms q1 q2 q3 q4 q5 q6 qp1 qp2 qp3 qp4 qp5 qp6 qpp1 qpp2 qpp3 qpp4 qpp5 qpp6

syms I111 I112 I113 I122 I123 I133 I211 I212 I213 I222 I223 I233 I311 I312 I313 I322 I323 I333 I411 I412 I413 I422 I423 I433 I511 I512 I513 I522 I523 I533 I611 I612 I613 I622 I623 I633

syms Beta

S = [pi, m1, m2, m3, m4, m5, m6, g, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, l1, l2, l3, l4, l5, l6, I111, I112, I113, ...
    I122, I133, I211, I212, I213, I222, I233, I311, I312, I313, I322, I323, I333, I411, I412, I413, I422, I423, I433, I511, I512, I513, I522, I523, I533, I611, I612, I613, I622, I623, I633, ...
    q1, q2, q3, q4, q5, q6, qp1, qp2, qp3, qp4, qp5, qp6, qpp1, qpp2, qpp3, qpp4, qpp5, qpp6, Beta];

g0=[0; 0; g]; 

q=[q1;q2;q3;q4;q5;q6];
qp=[qp1;qp2;qp3;qp4;qp5;qp6]; 
qpp=[qpp1;qpp2;qpp3;qpp4;qpp5;qpp6]; 

I1=[I111 I112 I113;
    I112 I122 I123;
    I113 I123 I133];

I2=[I211 I212 I213;
    I212 I222 I223;
    I213 I223 I233];

I3=[I311 I312 I313;
    I312 I322 I323;
    I313 I323 I333];

I4=[I411 I412 I413;
    I412 I422 I423;
    I413 I423 I433];

I5=[I511 I512 I513;
    I512 I522 I523;
    I513 I523 I533];

I6=[I611 I612 I613;
    I612 I622 I623;
    I613 I623 I633];


HT1_0 =  simple(H(      q1,   d1,    l1,  -pi/2));
HT2_1 =  simple(H(      q2-pi/2,   d2,   l2,   0));
HT3_2 =  simple(H(	q3+pi/2,   0,  0,     pi/2));
HT4_3 =  simple(H(	q4,   d4,  0,     -pi/2));
HT5_4 =  simple(H(	q5,   0,  0,     pi/2));
HT6_5 =  simple(H(	q6,   0,  0,     0));


HTcm1_0 =  simple(H(      q1,   d7,    l3,  0));
HTcm2_1 =  simple(H(      q2-pi/2,   d8,   l4,   0));
HTcm3_2 =  simple(H(	q3,   0,  l5,     0));
HTcm4_3 =  simple(H(	q4,   d9,  0,     0));
HTcm5_4 =  simple(H(	q5-pi/2,   0,  l6,     0));
HTcm6_5 =  simple(H(	q6,   d10,  0,0));  


HT2_0 = simple(HT1_0*HT2_1);
HT3_0 = simple(HT2_0*HT3_2);
HT4_0 = simple(HT3_0*HT4_3);
HT5_0 = simple(HT4_0*HT5_4);
HT6_0 = simple(HT5_0*HT6_5);

HTcm2_0 = simple(HT1_0*HTcm2_1);
HTcm3_0 = simple(HT2_0*HTcm3_2);
HTcm4_0 = simple(HT3_0*HTcm4_3);
HTcm5_0 = simple(HT4_0*HTcm5_4);
HTcm6_0 = simple(HT5_0*HTcm6_5);

status = 'homogenous transformations done'

Jcm1_0 = simple([(jacobian(HTcm1_0(1:3,4),q));[0;0;1],[0;0;0],[0;0;0],[0;0;0],[0;0;0],[0;0;0]]);
Jcm2_0 = simple([(jacobian(HTcm2_0(1:3,4),q));[0;0;1],HT1_0(1:3,3),[0;0;0],[0;0;0],[0;0;0],[0;0;0]]);
Jcm3_0 = simple([(jacobian(HTcm3_0(1:3,4),q));[0;0;1],HT1_0(1:3,3),HT2_0(1:3,3),[0;0;0],[0;0;0],[0;0;0]]);
Jcm4_0 = simple([(jacobian(HTcm4_0(1:3,4),q));[0;0;1],HT1_0(1:3,3),HT2_0(1:3,3),HT3_0(1:3,3),[0;0;0],[0;0;0]]);
Jcm5_0 = simple([(jacobian(HTcm5_0(1:3,4),q));[0;0;1],HT1_0(1:3,3),HT2_0(1:3,3),HT3_0(1:3,3),HT4_0(1:3,3),[0;0;0]]);
Jcm6_0 = simple([(jacobian(HTcm6_0(1:3,4),q));[0;0;1],HT1_0(1:3,3),HT2_0(1:3,3),HT3_0(1:3,3),HT4_0(1:3,3),HT5_0(1:3,3)]);


Jvcm1_0 = Jcm1_0(1:3,1:6);
Jwcm1_0 = Jcm1_0(4:6,1:6);

Jvcm2_0 = Jcm2_0(1:3,1:6);
Jwcm2_0 = Jcm2_0(4:6,1:6);

Jvcm3_0 = Jcm3_0(1:3,1:6);
Jwcm3_0 = Jcm3_0(4:6,1:6);

Jvcm4_0 = Jcm4_0(1:3,1:6);
Jwcm4_0 = Jcm4_0(4:6,1:6);

Jvcm5_0 = Jcm5_0(1:3,1:6);
Jwcm5_0 = Jcm5_0(4:6,1:6);

Jvcm6_0 = Jcm6_0(1:3,1:6);
Jwcm6_0 = Jcm6_0(4:6,1:6);

status = 'Jacobians done'

M1 = m1*(Jvcm1_0).'*Jvcm1_0 + (Jwcm1_0).'*HTcm1_0(1:3,1:3)*I1*HTcm1_0(1:3,1:3).'*(Jwcm1_0);
M2 = m2*(Jvcm2_0).'*Jvcm2_0 + (Jwcm2_0).'*HTcm2_0(1:3,1:3)*I2*HTcm2_0(1:3,1:3).'*(Jwcm2_0);
M3 = m3*(Jvcm3_0).'*Jvcm3_0 + (Jwcm3_0).'*HTcm3_0(1:3,1:3)*I3*HTcm3_0(1:3,1:3).'*(Jwcm3_0);
M4 = m4*(Jvcm4_0).'*Jvcm4_0 + (Jwcm4_0).'*HTcm4_0(1:3,1:3)*I4*HTcm4_0(1:3,1:3).'*(Jwcm4_0);
M5 = m5*(Jvcm5_0).'*Jvcm5_0 + (Jwcm5_0).'*HTcm5_0(1:3,1:3)*I5*HTcm5_0(1:3,1:3).'*(Jwcm5_0);
M6 = m6*(Jvcm6_0).'*Jvcm6_0 + (Jwcm6_0).'*HTcm6_0(1:3,1:3)*I6*HTcm6_0(1:3,1:3).'*(Jwcm6_0);


M = simple(M1 + M2 + M3 + M4 + M5 + M6);

status = 'M Matrix Done'


n=6;                                          
 for k=1:n                                    
     for j=1:n
           bp=0;
           for i=1:n
               bp=bp+(diff(M(k,j),q(i))*qp(i) +  diff(M(k,i),q(j))*qp(i) - diff(M(i,j),q(k))*qp(i) );
           end
           C(k,j)=bp/2;
     end
 end
 
C=simple(C);

status = 'C Matrix Done'

P=m1*g0.'*HTcm1_0(1:3,4)+m2*g0.'*HTcm2_0(1:3,4)+m3*g0.'*HTcm3_0(1:3,4)+m4*g0.'*HTcm4_0(1:3,4)+m5*g0.'*HTcm5_0(1:3,4)+m6*g0.'*HTcm6_0(1:3,4) ;  

G=[simple(diff(P,q1));
    simple(diff(P,q2));
    simple(diff(P,q3));
    simple(diff(P,q4));
simple(diff(P,q5));
simple(diff(P,q6))];

status = 'G Matrix Done'

%Qpp=(M)\(Tao-C*Qp-G-Beta*Qp);


Mp1=diff(M,q1)*qp1;
Mp2=diff(M,q2)*qp2;
Mp3=diff(M,q3)*qp3;
Mp4=diff(M,q4)*qp4;
Mp5=diff(M,q5)*qp5;
Mp6=diff(M,q6)*qp6;

Mdot=simple(Mp1+Mp2+Mp3+Mp4+Mp5+Mp6);

status = 'Mdot Done'

N=Mdot-2*C;
N=simple((N));

status = 'N Matrix Done'

tao = M*qpp + C*qp + G;

status = 'tao done'

id=fopen('M.txt','w');

for i=1:6
	for j=1:6
		s=sprintf('M(%d,%d)=%s\n',i,j,char(M(i,j)));
		fprintf(id,s);
	end
end
fclose(id);


id=fopen('C.txt','w');

for i=1:6
	for j=1:6
		s=sprintf('C(%d,%d)=%s\n',i,j,char(C(i,j)));
		fprintf(id,s);
	end
end
fclose(id);


id=fopen('G.txt','w');

for i=1:6
	for j=1:1
		s=sprintf('G(%d,%d)=%s\n',i,j,char(G(i,j)));
		fprintf(id,s);
	end
end
fclose(id);

id=fopen('Mdot.txt','w');

for i=1:6
	for j=1:6
		s=sprintf('Mdot(%d,%d)=%s\n',i,j,char(Mdot(i,j)));
		fprintf(id,s);
	end
end
fclose(id);

id=fopen('N.txt','w');

for i=1:6
	for j=1:6
		s=sprintf('N(%d,%d)=%s\n',i,j,char(N(i,j)));
		fprintf(id,s);
	end
end
fclose(id);

id=fopen('Tao.txt','w');

for i=1:6
        s=sprintf('Tao(%d)=%s\n',i,char(tao(i)));
		fprintf(id,s);	
end
fclose(id);
 
tao = expand(tao);

id = fopen('tao1.txt', 'w');
s = char(tao(1));
fprintf(id,s);

id = fopen('tao2.txt', 'w');
s = char(tao(2));
fprintf(id,s);

id = fopen('tao3.txt', 'w');
s = char(tao(3));
fprintf(id,s);

id = fopen('tao4.txt', 'w');
s = char(tao(4));
fprintf(id,s);

id = fopen('tao5.txt', 'w');
s = char(tao(5));
fprintf(id,s);

id = fopen('tao6.txt', 'w');
s = char(tao(6));
fprintf(id,s);

status = 'saving txt files done'