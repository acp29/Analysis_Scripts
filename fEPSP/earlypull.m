function out = earlypull

%% Exemplary fEPSP Plots
% Simple function to pull the early section of fEPSP recordings and zeroed
% by trace

%% Parameters
% Define Sample Rate in kHz
samplerate = 40;


%% Analysis
% Clear windows
%close all

% navigate to directory
cd(uigetdir)

% Parse into a cell array.
d = dir;
d = d(~startsWith({d.name}, '.')); % remove deleted/hidden
dirFlags = [d.isdir];
d = d(dirFlags);
num_folders = size(d,1);

% Change directory to first sweep 
% Note, not first folder as that's the master folder
Trace = NaN(8000,num_folders);
for i = 1:num_folders
    filename = append(d(i).name,'\Clamp2.ma');
    Data = h5read(filename,'/data');
    Trace(:,i) = Data(:,1);
end

% adjust sweeps to zero and smooth to compensate for noise
basemean = mean(Trace(1:3500,:));
adjusted = Trace(:,:) - basemean;
out = adjusted(:,:);
figure
plot(out)
title('all waves')

% plot selected waves
selected = [1, 20, 40, 60];
figure
hold on
for j = 1:size(selected,2)
    plot(out(:,selected(j)))
end
title('selected waves')
legend(string(selected))
