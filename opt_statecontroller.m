function y = opt_statecontroller(x)

global Ki k1 k2 k3

Ki = x(1);
k1 = x(2);
k2 = x(3);
k3 = x(4);

sim('D:\Studia\III stopnieñ\Symulacje\Regulator stanu\state_controller.slx')

y = fit_fcn;

% Ki =  143.2501
% k1 =   41.9535
% k2 =   32.6388
% k3 =   16.4139

% Best yet
% Ki =  365.1232
% k1 =   46.4840
% k2 =    1.1183
% k3 =    9.7211

% LB = [200 20 0 0];
% UB = [500 100 20 20];

% 498.6169   26.4690    0.9689    7.9304   2T2

% 489.4666   96.7594    3.4237    0.6889   4T2

%
