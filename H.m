

function H = H(q,d,l,a)


H =[cos(q), -sin(q)*cos(a),  sin(q)*sin(a),  l*cos(q);
    sin(q),  cos(q)*cos(a), -cos(q)*sin(a),  l*sin(q);
     0    ,         sin(a),         cos(a),         d;
     0    ,              0,              0,        1];


end