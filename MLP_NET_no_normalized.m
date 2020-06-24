function data=MLP_NET_no_normalized()
close all
clear
NumHiddenLayer=10;

%% Input Output Data
Data = xlsread('data.xlsx');
XN= Data(:,1:end-1); YN= Data(:,end);

%Test and Train Data
TrPercent = 70;
DataNum = size(XN,1);
TrNum = round(TrPercent * DataNum/100);
R = randperm(DataNum);
TrInx = R(1:TrNum);TsInx = R(TrNum+1:end);
TrainInputs= XN(TrInx,:);TrainTargets= YN(TrInx,:);
TestInputs= XN(TsInx,:);TestTargets= YN(TsInx,:);

%% FFNN ANNLMBP
net = feedforwardnet(NumHiddenLayer, 'trainlm');
net = train(net,TrainInputs',TrainTargets');
save net

F1TrNET=sim(net,TrainInputs');
F1TsNET=sim(net,TestInputs');

F1YtrNET = F1TrNET';
F1YtsNET = F1TsNET';

save('net')

%% save  TrainInputs TrainTargets TestInputs TestTargets
   data.TRIn = TrainInputs;      data.TSIn = TestInputs;
   data.TrainNET=F1YtrNET;       data.TrainTargets=TrainTargets;
   data.TestNET=F1YtsNET;        data.TestTargets=TestTargets;   
% main outputs
   data.Train=[data.TRIn data.TrainTargets data.TrainNET];
   data.Test=[data.TSIn data.TestTargets data.TestNET];
end




   