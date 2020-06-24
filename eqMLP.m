function eq=eqMLP()


wb=getwb(net)

[b,IW,LW] = separatewb(net,wb)

b{1}

IW{1}

LW{2,1}

save('net')